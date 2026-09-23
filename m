Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6178EC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3QL0JBh11KsKfmNd8SEMf7tMAHy0V22b19fkJafS9o=; b=mDu6PnJLTX/plw5zxrxEL457Dh
	wrUsqkL2ALOvuuiPtkzthVU9nJxFxfjcg4Q6zfqNIUzO5fxkx7yXfLKE+Ph+pf6vUn/H3/Q4a2eFb
	7FsyS8UQ/1rJXwA7YcF9Hm7eWSJzW8vR03F5/PVRadGPREmPQAmVnU9yuGO3QTRTjG+Dd0y7Q5XZH
	S98CRUWFTTaNTQgBpyjlEjnWgvoLZ7WFJCUgr7iFo3Oc+Dul4eZS/xciy6Gx6ud3wEpZ4EypQ91Ka
	gTcygjLQMDcGH3H44iNqM7HAMnMt5y92ta4hHDxQZOZZvS5TGbTrHIKElv4CdQdk+e+G0LC7j15fi
	S5eu/+Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lfa-00000008AZ5-18r4;
	Wed, 23 Sep 2026 12:01:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LfZ-00000008AYh-1Xg0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:01:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 91AC1600AA;
	Wed, 23 Sep 2026 12:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100E91F000FF;
	Wed, 23 Sep 2026 12:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790164908;
	bh=z3QL0JBh11KsKfmNd8SEMf7tMAHy0V22b19fkJafS9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=orJvCK2t9mf6DE4bOUoAmMBT3XRccZPekd/P7JHA4HUvlk5Dng+WvEu4ROYNUzuS7
	 gSnJ4UR5vKEjIUAK1QE+gTrA4yVW6TQU2KglXbkcDall3bjs8DyAxqkTM1HEqHhh6I
	 4h0254o38tW1sO9odsnUgV8Gexv8zWy3PSiBChwjC7R/Na/vn3Unwu7K863PY6FVsm
	 zdIU5WJizfDWlq93eS4YL9sQu9c1IJ8ircHX+8Fn2Q41X+PhapvJUVGoKZJzUElAku
	 uOZtsf3DmwkY3ZuIH6tYcSyqd8eJBItpF/gYuM8OOLTUfMlb/njgq3pslGSVNVxPvV
	 RJIrMd+eQSjCg==
Date: Wed, 23 Sep 2026 13:01:44 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
 <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Sep 23, 2026 at 01:26:00PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 23-Sep-26 12:49, Sudeep Holla wrote:
> > On Wed, Sep 23, 2026 at 12:23:50PM +0200, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 23-Sep-26 11:07, Sudeep Holla wrote:
> >>> On Mon, Sep 21, 2026 at 05:19:45PM +0200, Uwe Kleine-König wrote:
> >>>> On Fri, Sep 18, 2026 at 11:29:50AM +0200, Hans de Goede wrote:
> >>>>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> >>>>>
> >>>>> SCMI client drivers already describe their bus match data with
> >>>>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
> >>>>> SCMI device tables. As a result, SCMI modules do not get generated module
> >>>>> aliases from their id tables.
> >>>>>
> >>>>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
> >>>>> visible to modpost, add the corresponding generated offsets and teach
> >>>>> file2alias to emit scmi:<protocol>:<name> aliases.
> >>>>>
> >>>>> Use the same stable alias format for SCMI device uevents and sysfs
> >>>>> modaliases. The previous string included the instance-specific device
> >>>>> name, which is not useful for matching modules.
> >>>>>
> >>>>> Assisted-by: Codex:GPT-5.5
> >>>>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> >>>>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> >>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> >>>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> >>>
> >>> [...]
> >>>
> >>>>> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
> >>>>> new file mode 100644
> >>>>> index 000000000000..1b4ccfa9dcc5
> >>>>> --- /dev/null
> >>>>> +++ b/include/linux/device-id/scmi.h
> >>>>> @@ -0,0 +1,17 @@
> >>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>>>> +#ifndef LINUX_DEVICE_ID_SCMI_H
> >>>>> +#define LINUX_DEVICE_ID_SCMI_H
> >>>>> +
> >>>>> +#ifdef __KERNEL__
> >>>>> +#include <linux/types.h>
> >>>>> +#endif
> >>>>> +
> >>>>> +#define SCMI_NAME_SIZE		32
> >>>>> +#define SCMI_MODULE_PREFIX	"scmi:"
> >>>>> +
> >>>>> +struct scmi_device_id {
> >>>>> +	__u8 protocol_id;
> >>>>> +	char name[SCMI_NAME_SIZE];
> >>>>
> >>>> I wonder if you tried to keep this a char *. ISTR someone did something
> >>>> similar recently and they claimed it worked. That would get rid of the
> >>>> artificial name size limit and simplify this patch.
> >>>>
> >>>
> >>> I agree with this. 
> >>
> >> Ok, so I checked and no other include/linux/device-id/*.h file
> >> defines a foo_device_id field with a type of "char *" and
> >> then uses that field in scripts/mod/devicetable-offsets.c /
> >> scripts/mod/file2alias.c .
> >>
> > 
> > I looked at hda_device_id and its uses. It looks like it does use
> > char * and there were loads of drivers initialising the string. I must
> > be missing something then ?
> 
> If you look for hda_device_id in:
> 
> scripts/mod/devicetable-offsets.c
> scripts/mod/file2alias.c
> 
> Neither references the name member of struct hda_device_id.
> 
> So the actual modalias(es) added to the .ko by modpost
> do not include the name, they are of the following format:
> 
>         ADD(alias, "v", vendor_id != 0, vendor_id);
>         ADD(alias, "r", rev_id != 0, rev_id);
>         ADD(alias, "a", api_version != 0, api_version);
> 
>         module_alias_printf(mod, true, "hdaudio:%s", alias);
>

Indeed, thanks for the pointer.

> >> 2 device-id/foo.h headers (dmi, pcmcia) do define a "char *"
> >> field, but then do NOT use that to generate a modalias.
> >>
> >> So scmi_device_id would be the first to do this.
> >>
> > 
> > Your response made me dig further and I found snd_hdac_codec_modalias()
> > which seems to do the magic there.
> 
> Note that function:
> 
> int snd_hdac_codec_modalias(const struct hdac_device *codec, char *buf, size_t size)
> {
>         return scnprintf(buf, size, "hdaudio:v%08Xr%08Xa%02X\n",
>                         codec->vendor_id, codec->revision_id, codec->type);
> }
> 
> Also does not include any name field into the modalias. Note this
> side is the modalias which shows up under
> 
> 
> /sys/bus/xxx/devices/yyy/modalias
> 
> not the one which gets included into the .ko (and can be shown
> by "modinfo") that one comes from scripts/mod/file2alias, but
> the 2 must match of course otherwise udev will not load the .ko.
> 
> So it seems the name field in struct hda_device_id is only
> there for the kernel to include it in some log messages,
> just like e.g. the dmi_device_id "ident" string.
> 
> But this is not used by the modpost code which adds
> the modalias to the .ko, that tool is the one which has
> problems with non const size strings.
> 

Agreed.

Uwe, are you OK to keep the name with limited size ? Let us know.

If Uwe is fine, yes I can take v7 as is.

-- 
Regards,
Sudeep

