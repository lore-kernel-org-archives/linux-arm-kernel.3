Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F00C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pgWXPFF4dO5j5XyrOv14vAHpJ4O49nfm35Y0Nv32ko=; b=xggakYIPyGT/lsT+fSEuXdjzSB
	F2xzy9VwhdHtZRbInGyTazAPQXKigaq7KBJsnkHZXS10Csk/WdZN0c+cqKiOtm06IJX1sttBk6wxR
	RlU8OsC+PXeUfNvxqfkzkfB1wmcIzur3LcjrficTM0RzfPA0fv45izZQI5inAouqOnneJheBPuwtT
	J55u+tjriGB0Vebj0VFDGP290OluNeXieblW1GORJz0LcQ23y9O9re0GRZiKH3BX812cUnzVjceUh
	5IKnjVwVkOs6FJpO+c7kCv6IyIu8eF7ZzOmQ9MkUpJ509SXN9pGdkarGyCprZHLtyTOMANN9LaBU1
	Eigp9vtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZlw-00000000ukp-40Gj;
	Thu, 15 May 2025 14:41:20 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZYd-00000000swH-43Z2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 14:27:37 +0000
DKIM-Signature: a=rsa-sha256; b=ZFZILwmD7YC334uJWUSSaoozvnAwB/bun/UY/j4LOLszgSK7nHJHQv5OWtnsgllixenYRk9hnWg8nMlTXhGqtTh0cLgvDYwBceYvZdCPcMMBsZkQWGM4aLSfp+KHoPkcyJC/WP9LPp0Gu9b+lTP/qCKs81AWEMZUAzCwdDBlDo3zqO1teVBRUTU2hCagpLUl/jCUk5pBPZxZQNXSdjTJzuZlGtK0JBwFgkNEd/YR5CpElj31YM00Mw1sGjJ4I56jp+tNZQ7yf33ugvNPxxsJREEY9bvrR7zRqm12VM/BLoTtKRw/Xb0/C8aVOZhzx+t2ZS7+Ecrww4fd3pdzmEJt9g==; s=purelymail1; d=purelymail.com; v=1; bh=4pgWXPFF4dO5j5XyrOv14vAHpJ4O49nfm35Y0Nv32ko=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1592338441;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 15 May 2025 14:26:53 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 May 2025 16:26:48 +0200
Message-Id: <D9WSYR0CJUC1.3RCB16LZ3S6P7@mentallysanemainliners.org>
Cc: "Kishon Vijay Abraham I" <kishon@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/2] USB PHY support for Exynos990 SoCs
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Vinod Koul" <vkoul@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250420-usb-resends-april-v2-0-25dc7d2e6dd4@mentallysanemainliners.org> <aCRXgpD0Ld2W4lHE@vaman> <D9VYC98LJTR0.LJXYC1H0BAKA@mentallysanemainliners.org> <aCWj4cn4y+RyfGiZ@vaman> <ea1a7a37-031f-4f81-ba09-eaa523f70761@kernel.org>
In-Reply-To: <ea1a7a37-031f-4f81-ba09-eaa523f70761@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_072736_069437_7FB21406 
X-CRM114-Status: GOOD (  15.96  )
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

On Thu May 15, 2025 at 11:14 AM CEST, Krzysztof Kozlowski wrote:
> On 15/05/2025 10:20, Vinod Koul wrote:
>> On 14-05-25, 16:26, Igor Belwon wrote:
>>> On Wed May 14, 2025 at 10:42 AM CEST, Vinod Koul wrote:
>>>> On 20-04-25, 21:28, Igor Belwon wrote:
>>>>> Hi all!
>>>>>
>>>>> This patchset adds support for the USB 2.0 PHY of the Exynos990 SoC.
>>>>> This SoC has a combo PHY that supports highspeed, superspeed USB and
>>>>> DisplayPort, however due to my inability to test the superspeed part =
of
>>>>> the combo phy (device always enumerated as high-speed, even on the
>>>>> vendor kernels/bootloaders) only the highspeed part is brought up.
>>>>>
>>>>> These changes have been tested and confirmed working (with the USB_ET=
H
>>>>> gadget and telnet/ssh in a ramdisk) on a device from the hubble famil=
y
>>>>> (x1s) and also a device from the canvas family (c1s).
>>>>
>>>> I am missing the dt patch, can you pls report the whole series if you
>>>> would like me to review and apply this
>>>
>>> Hi Vinod,
>>>
>>> I've sent the DT series a while back (before resending). Usually I
>>> propose DT changes through Krzysztof's tree. The patches are=20
>>> unchanged (they will be resent unchanged when all usb and wdt=20
>>> changes are merged).
>>=20
>> It makes sense to post bindings and driver togther and mostly these go
>> thru subsystem trees!
>>=20
> I don't think you both speak about the same thing. DT is ambiguous here,
> so always use DTS or DT bindings... that said bindings were here in this
> patchset so if Vinod misses them, this has to be resent.
>
> Best regards,
> Krzysztof

Hi Krzysztof, Vinod.

Krzysztof: Thank you for the clarification. I assumed somehow the
devicetree changes were necessary for the revies. Bad judgment on my part.
Sorry.

Vinod: Sorry for the misunderstanding. I'll resend the patchset shortly.

Regards,
Igor

