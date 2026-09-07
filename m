Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A66C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 08:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYZU5RO6CYFxX9eTl7af4fFLgMjpF7i3FvHd4okjQY4=; b=D/fSCq/GI2EXNVrdKa40gxMaK8
	GE8tXGRodVa2XyCJUrFxGhYkhpRCnRVehBZ4/z5D0gjAxaqe8DIBKLiBmtqmEZq+zzM1p032w8nZQ
	jjhCVVIZoqM5gNef4AZ553Ne26oDUbSf5Wp3BBcdiKumcTVBFDRGJsXoWRwAKZh9UqO50uN6PzLwP
	utqJ/vVlNAdBWtpmCNRNtFoUgmYyNmqGA1wQlbw4z0SgBAvvejv7qcPFMqPMCuU2n+UmIHQCrhJgq
	xsA8pBUhT/eHFZFSSfibdx2f1i6Y3gY6FAzf5nv82tXdB83HQDpoYtvoxYo4l2GuUd66LcgdwyqEG
	jkQ7TNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3V74-00000006Jru-3R1T;
	Mon, 07 Sep 2026 08:54:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3V74-00000006Jrh-0ag7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 08:54:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 75BA340B6E;
	Mon,  7 Sep 2026 08:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E6C1F00A3A;
	Mon,  7 Sep 2026 08:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788771241;
	bh=zYZU5RO6CYFxX9eTl7af4fFLgMjpF7i3FvHd4okjQY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LHWtZj1MrbItATH4GpA+a+bccFcr3C+07mOYvNJB5lbc1BCKtwCE7Y+2ZugLzUuP4
	 qYO1C6CogNEN0bLUTjfs+GLnXmV+HHdiLp07WOgtLugL7+MjJPQawTKyoRBxyBlW2T
	 XlL+gxBUUcSjRu1fgLqUqdlL6IPTmpI+RsJw50VPszK/eyqpbfiPXguYAPCjjOuZ4y
	 nK9kkveX1Jmf+oAJIEJR7RX+jjGMQd8yJ5rVBzcFu0n9lt6BPpOBenI4ihEqGuvbqQ
	 OC0BggKLGNnUozcxyAnADkiZe5ymQkYPwQeeLK/xUVLq+doJG7x7lRBYQ9rYksWmqY
	 SLms1cLComjBw==
Date: Mon, 7 Sep 2026 09:53:57 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: scmi: Replace get function and group info
 with generic callbacks
Message-ID: <20260907-airborne-cobra-of-democracy-a9c411@sudeepholla>
References: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
 <an7RL_mTsznZjeIQ@pluto>
 <56107a6d-962d-4508-a1d3-7a6e9e2af887@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56107a6d-962d-4508-a1d3-7a6e9e2af887@oss.qualcomm.com>
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

On Fri, Aug 14, 2026 at 05:05:27PM -0700, Alex Tran wrote:
> > Hi Alex,
> >
> > I gave it a go at this series on an emulated setup and with these
> > changes I get:
> >
> > root@deb-guest:~# modprobe pinctrl-scmi
> > [   15.329932] scmi-pinctrl scmi_dev.4: error -EINVAL: Failed to register functions
> > [   15.330259] scmi-pinctrl scmi_dev.4: probe with driver scmi-pinctrl failed with error -22
> >
> > ...not debugged any further.
> >
> > Thanks,
> > Cristian
> Hi Cristian,
> 
> I've tested this series on sa8797p hardware and did not experience any issues
> with registering functions during probe. Can you provide me with the pin
> topology of your emulated setup? I have a hunch that the topology may
> contain a function with 0 groups which is why -EINVAL is being returned.
> The previous pinctrl_scmi_get_function_groups callback considered a function
> with no groups invalid.

I found couple of feedback from sashiko valid, can you take a look at all the
comments there[1] ?

-- 
Regards,
Sudeep

[1] https://sashiko.dev/#/patchset/20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com

