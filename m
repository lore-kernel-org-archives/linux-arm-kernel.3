Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA956C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbJlN7jitHcpATJIzTdtSIk8V9emdxHiUWGjROlMWy0=; b=hGWr+E24AaI9jyzHSXDCYkJudq
	Rp1XC4LR4PztfP0z7v97QiBcH7Grs0GAbQXsh9WvZeEHnh/lxVegFvmowk8GYRfCO6A1wNSa5tdSB
	GnD17NXQhUx+KVehUap3zQbb+QTWHuY5UMxgSIigsck0ndPCX5C9Xh9kCHX82tJObZnWztf5AeMFL
	nZ4WkImGqwXFJ1hBWdAjWQtRZn6yNWzlTF5amdxwDY0cAZ3Bmy5QJNVQzgAi9gtK0RsPRc5r+pENn
	fVzSaQaDe0xcKRYr1zXfeWlWFSHB0x7a0S8tt6XMl7t40loisxQsM7NV1UpeD8ChBjnV9eXKQcmR/
	C0qFON7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnclo-00000007JbH-2Lwk;
	Thu, 27 Feb 2025 12:13:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncLm-00000007EKV-3yy7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 11:46:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F48F15A1;
	Thu, 27 Feb 2025 03:47:02 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F9093F6A8;
	Thu, 27 Feb 2025 03:46:44 -0800 (PST)
Date: Thu, 27 Feb 2025 11:46:42 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] pinctrl: sunxi: allow reading mux values from DT
Message-ID: <20250227114642.28752709@donnerap.manchester.arm.com>
In-Reply-To: <12609538.O9o76ZdvQC@jernej-laptop>
References: <20250214003734.14944-1-andre.przywara@arm.com>
	<20250214003734.14944-6-andre.przywara@arm.com>
	<12609538.O9o76ZdvQC@jernej-laptop>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_034647_037783_61855F03 
X-CRM114-Status: GOOD (  28.92  )
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

On Tue, 18 Feb 2025 18:09:09 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne petek, 14. februar 2025 ob 01:37:31 Srednjeevropski standardni =C4=8D=
as je Andre Przywara napisal(a):
> > So far every Allwinner SoC needs a large table in the kernel code, to
> > describe the mapping between the pinctrl function names ("uart") and
> > the actual pincontroller mux value to be written into the registers.
> > This adds a lot of data into a single image kernel, and also looks
> > somewhat weird, as the DT can easily store the mux value.
> >=20
> > Add some code that allows to avoid that table: the struct that describes
> > the existing pins will be build at *runtime*, based on very basic
> > information provided by the respective SoC's pinctrl driver. This
> > consists of the number of pins per bank, plus information which bank
> > provides IRQ support, along with the mux value to use for that.
> > The code will then iterate over all children of the pincontroller DT
> > node (which describe each pin group), and populate that struct with the
> > mapping between function names and mux values. The only thing that needs
> > adding in the DT is a property with that value, per pin group.
> >=20
> > When this table is built, it will be handed over to the existing sunxi
> > pinctrl driver, which cannot tell a difference between a hardcoded
> > struct and this new one built at runtime. It will take care of
> > registering the pinctrl device with the pinctrl subsystem.
> >=20
> > All a new SoC driver would need to do is to provide two arrays, and then
> > call the sunxi_pinctrl_dt_table_init() function.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
>=20
> I went through the code and it makes sense.

Many thanks, that's much appreciated!

> I wonder if we really need to
> build whole table instead of having on demand lookups into DT. However,
> for now, this will do. So:

I agree that would make some sense, but is also quite a departure from the
current driver, which we have been using for more than a decade now. And I
guess that would mean that we would need to maintain the two approaches,
for the old SoCs, and the new ones? With that patch here generic changes
can be applied just to the one core driver, dealing with the pinctrl
subsystem.

> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Thanks,
Andre

> Thanks!
>=20
> Best regards,
> Jernej
>=20

