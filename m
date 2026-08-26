Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EA2C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 19:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGuBe6Xxv/7LYE3cIlxPiI6vCF8iwOw4R1p9fKhoQdw=; b=2oNQ1iEGYGl/u9SBq7xzLtxhfz
	+21O9QeL4FuTfqyIaNVTERg2on+/XxBWxJTR5fbpQoFjSe0IggX1qnZg8+Tuy5B+f4GFxOuKGXw93
	XOdUlEDkNh5HbRolifdInwfTHiSFKjkot4AZQTiMjNzpzheKtkGrYuGW0OoXgQrvnc0O5ukxEhape
	ddIDHjb5BxK8kjEAUdLZdIky9Ch86c+IkKQCMemKUgzyBaMp+hAAeTBLUir5t56b+jgnfp3Ipr4vl
	Jd9un4Wxcv8cbass1+YfDWHzE8V/DGmJDnX8IadVlY0ikEfALXR5xxtIMuVFiXWrpqeylYmQ0MZEP
	sCbBPt1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzJXh-00000002wdQ-25yI;
	Wed, 26 Aug 2026 19:44:13 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzJXe-00000002wcc-1Mmj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 19:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-2eefaa527c; t=1787773449;
 bh=PGuBe6Xxv/7LYE3cIlxPiI6vCF8iwOw4R1p9fKhoQdw=;
 b=P+IFbcMdt+3lk39+AMndWBgUrX121TEQh2pO06Pvgjwo4r3Nx8OOw0+2ljZSKYZtmeSRYzXbu
 hdpnlL5/v982u+b/z9HW8yMclwIadBcbbNu24ofi5hcpYNFWIOm/Ot/cg9PUBCKOFCMWGyD3Bq0
 AIS4rJ/zb7jL8BbS6XEpVW4=
X-Forward-Email-ID: 6a8f4202150ee80826965353
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <5e8698db-974c-4f8b-8939-bcdf8a47743d@lineageos.org>
Date: Wed, 26 Aug 2026 20:43:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 krzysztof.kozlowski@oss.qualcomm.com, peter.griffin@linaro.org,
 alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <CAPLW+4kQTUX8QhKnAP7bg=iCw5hhNQZoW7cuOpTdvvAUpGaicg@mail.gmail.com>
 <135d48e7-58ac-48b8-8fa5-c2548e2f3ae9@lineageos.org>
 <DKZ3X5VUHJSK.1KSJR6K8FATGV@linaro.org>
Content-Language: en-GB
From: Thomas Turner <tturner@lineageos.org>
In-Reply-To: <DKZ3X5VUHJSK.1KSJR6K8FATGV@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_124410_454469_78CD2AC6 
X-CRM114-Status: GOOD (  25.75  )
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

On 26/08/2026 20:02, Alexey Klimov wrote:
> On Tue Aug 25, 2026 at 10:05 PM BST, Thomas Turner wrote:
>> Hi Sam and Alexey,
>>
>> On 19/08/2026 20:51, Sam Protsenko wrote:
>>> Can you please tell us a bit about how you tested this patch, and on
>>> which board? As DPU is not currently enabled on Exynos850 SoC, I'm not
>>> sure how exactly GPU can be useful. If you have a use case or a
>>> testing procedure we can run on the E850-96 board, please share.
>>>
>>
>> Sam, Alexey could you please test GPU on the E850-96 board by following
>> these instructions:
>>
>> 1) Apply this patch series locally
>> 2) Change status="disabled"; to status="okay";
>> 3) Make sure these configs are enabled:
>> CONFIG_DRM_SIMPLEDRM=y
>> CONFIG_DRM_PANFROST=y
>> 4) In terms of regulators we set up a basic mali regulator via our
>> secondary bootloader [1] and configured with this dts setup [2], NOTE
>> you may be able to get away with a dummy regulator so try that first.
>> If not I am sure you can replicate something simple with u-boot PMIC.
>> 5) Boot a GUI, I saw Debian was used for the bring-up, that should work
>> 6) Run the following command:
>> $ dmesg | grep "panfrost"
>> 7) Compare that to the output at [3]
> 
> Your email subject still seems to be null.
> 
> [   15.206193] panfrost 11500000.gpu: clock rate = 377000000
> [   15.206322] panfrost 11500000.gpu: error -ENODEV: _opp_set_regulators: no regulator (mali) found
> [   15.206513] panfrost 11500000.gpu: supply mali not found, using dummy regulator
> [   15.206840] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x0 status 0x0
> [   15.213137] panfrost 11500000.gpu: features: 00000000,00000df7, issues: 00000000,00000400
> [   15.221271] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [   15.233080] panfrost 11500000.gpu: shader_present=0x1 l2_present=0x1
> [   15.240488] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
> [   15.250497] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0

You seemed to have missed out step (4) of my instructions, if you set-up
regulators correctly this error will disappear.

> [root@e850usb ~]# uname -a
> Linux e850usb 7.2.0-next-20260825-00009-g647b48e80572-dirty #8 SMP PREEMPT Wed Aug 26 17:05:45 BST 2026 aarch64 GNU/Linux
> 
> I have different DRM_SIMPLEDRM options and related  enabled but nothing
> pops up via HDMI (at least I tried simple xorg-server things).
> Is it possible that your bootloader initilises some framebuffer and inserts
> it into DTB that passed to kernel? Or you have some other pieces in
> kernel/dt that implement missing functionality?

Our bootloader does intialise a framebuffer, and we have a node in our device
tree which makes it usable. Not sure how exactly the e850-96 device sets
things up but you can take a look at our fork if you want, [1].

> Here it seems there are no outputs:
> [root@e850usb ~]# ls -al /dev/fb*
> ls: cannot access '/dev/fb*': No such file or directory
> 
> and there no simle framebuffer or related logs. "DPU is not currently
> enabled on Exynos850 SoC" looks like the reason.

hm, I am pretty sure our bootloader configures DPU for us so that might be
why it works for us and not for you.

> Panfrost itself seems to be alive though:
> 
> [root@e850usb ~]# eglinfo -B
> GBM platform:
> EGL API version: 1.5
> EGL vendor string: Mesa Project
> EGL version string: 1.5
> EGL client APIs: OpenGL OpenGL_ES
> OpenGL core profile vendor: Mesa
> OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL core profile version: 3.1 Mesa 26.2.1-arch1.1
> OpenGL core profile shading language version: 1.40
> OpenGL compatibility profile vendor: Mesa
> OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL compatibility profile version: 3.1 Mesa 26.2.1-arch1.1
> OpenGL compatibility profile shading language version: 1.40
> OpenGL ES profile vendor: Mesa
> OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.2.1-arch1.1
> OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10
> 
> Best regards,
> Alexey

Best Regards,
Tom

[1] https://github.com/samsungexynos850/linux/commits/master


