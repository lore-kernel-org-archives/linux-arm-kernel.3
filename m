Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29685CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 21:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18/hRtcZ7Jpwt5r2jIqHkABCIMqEurt/5MGnB9tK66E=; b=23lPRU1vHOBfo0wE9h/8etP+ZA
	/duGPvjymAUsXm/OJ+7jwnHBOtBIyuywzUTPsS9v/TpwLccqy7Cq2G1+jvTRwLFYG2mLeG/7r+Q4r
	JsUtru8EWM1k1U9VE5p26UXVotAiLHu58kgo0IqXDxaK6UYVjCtCd9zvVW0SxF/zY8M/HkiYbva06
	Bdr573Ir9X/A4tJIVg7+84z7PrLRiZgbgXJI8BV72QcPLXUceqPyR3YiZtYPYPOVM2cpU5AB/Ziey
	hvJYjD+m1bNLddAbleaIwsysYI5ooeD+i2KzRtQQTDLCZ1g4H/ZEHREEFUmAzKxvBjvKVKskWZg9R
	0yg3zbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTg3-000000015Oc-25Cl;
	Fri, 07 Nov 2025 21:07:23 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTg1-000000015Nh-1R0z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 21:07:22 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vHTeG-0001aK-Mg; Fri, 07 Nov 2025 22:05:32 +0100
Message-ID: <da41c891-db89-436f-a262-61dfd33d57f9@pengutronix.de>
Date: Fri, 7 Nov 2025 22:05:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif
 fallback
To: Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: marex@denx.de, stefan@agner.ch, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251013205155.1187947-1-festevam@gmail.com>
 <4bd512fd-b3df-484a-8a04-a1ed066c42fa@nxp.com>
 <CAOMZO5AGRejEwNvkH0Di0HVi8QPduTeCSud+_GqOkD4tqEcsdA@mail.gmail.com>
 <37b8d968-a725-404e-8fd4-84c2a0bb464c@nxp.com>
 <CAOMZO5B+VcGxx9Xa6FFXxeka0qcqBmATrartguqMLMDK4fGduA@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAOMZO5B+VcGxx9Xa6FFXxeka0qcqBmATrartguqMLMDK4fGduA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_130721_382543_F049236C 
X-CRM114-Status: GOOD (  17.07  )
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

Hi,

On 04.11.25 21:44, Fabio Estevam wrote:
> On Mon, Oct 20, 2025 at 11:53 PM Liu Ying <victor.liu@nxp.com> wrote:
>> On 10/20/2025, Fabio Estevam wrote:
>>> On Tue, Oct 14, 2025 at 1:12 AM Liu Ying <victor.liu@nxp.com> wrote:
>>>
>>>> Strictly speaking, I don't think i.MX6SX LCDIF is compatible with i.MX28 LCDIF
>>>> because at least i.MX28 LCDIF has the version and debug{0,1,2} registers(at
>>>> 0x1c0, 0x1d0, 0x1e0 and 0x1f0) while i.MX6SX LCDIF hasn't.

Thanks for pointing this out. In my opinion, these registers are auxiliary
and don't really change the compatibility situation as a functional driver
can be written without their use, evidenced by the Linux driver doing just
fine without using these registers.

>>> There are some DT users, such as Barebox that matches against
>>> fsl,imx28-lcdif, so we cannot remove it.
>>
>> Hmmm, it looks like software projects like Barebox don't really follow this DT
>> binding.  Is it possible to fix Barebox to avoid changing this DT binding by
>> this patch?  I'm assuming that Uboot has already been fixed.
> > What do you think?

I am sorry my prior feedback ended up stalling this series.

There is a lot of regressions happening due to upstream DT changes and I am
just trying to raise awareness. Another example I stumbled over today:
https://lore.kernel.org/all/91f764ab-bec1-4791-b01b-3ba0803ce8f8@pengutronix.de/


I have submitted a patch[1] to barebox adding explicit i.MX6 SoloX support,
so, having expressed my opinion above, please proceed as you see fit.

[1]: https://lore.barebox.org/barebox/20251107210033.2229781-3-a.fatoum@barebox.org/

Cheers,
Ahmad

> 
> Thanks
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

