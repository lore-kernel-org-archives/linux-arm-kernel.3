Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DBFD59F67
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 21:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBLyzvIh7CKmRzey/NIzdLIeO4OLcavrJ7K8Oj+KhKw=; b=OU1rHlsPC5hMB2TNyKNuSx8cOk
	eW+pN2a2QvjpmlBhiJuhbdxavBqQbZrv9SI8VMANMHSLosg/e+69Qpb7sYNa3njf51Q5s+Af2xaXc
	injM0s5GAuonKMBmvP6ojBqi61qQNWwFbt/v5RuSrCY4vRjrbAexZBfJ8oW29iDBfu7cXf/cmNSvK
	IUmPI0fvN/jzOFgAEWIACWwZTjEoU5/9JfxmQvVSoLWzVOKMJh96WtzLw/Q9qcOZky686D+/Ut9Qj
	p83u2Vte50U36Aoa4WIB0fJDM0RRUmwtJLWVh96FaaIdYxL7YCnrs0DbikdALb141PhSjvD7/Y1M1
	GsFtSHUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8nQs-00000004mgB-1Ypc;
	Wed, 06 Nov 2024 21:19:18 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8nP7-00000004mOp-0LPM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 21:17:31 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id 5A4E81015D2;
	Wed,  6 Nov 2024 21:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1730927845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hBLyzvIh7CKmRzey/NIzdLIeO4OLcavrJ7K8Oj+KhKw=;
	b=LzIQnRUr49A6oV1zsN6hj4DQg175lI5Ckwwx0fKML1DlY02b6TiyogV0L4LmgS0z10j1Cf
	zcH+mOp5qGZaocNlvqSXhAUcYDe5fbF2cNHQq3oCkkxWUQwYybxqfC+8rUhsD1C49k5P+l
	AI7wyL3wE5PK1RctS0hhkd7w7TES++A=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id B16304009E;
	Wed,  6 Nov 2024 21:17:24 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 06 Nov 2024 22:17:24 +0100
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, frank-w@public-files.de
Subject: Re: [PATCH] arm64: dts: marvell: Drop undocumented SATA phy names
In-Reply-To: <CAL_JsqKfpVVVh6L0PLmieBO3qMFpcDfWFwd+5=qzH_MbeZt31Q@mail.gmail.com>
References: <20241014193528.1896905-2-robh@kernel.org>
 <87r07p8x12.fsf@BLaptop.bootlin.com>
 <0A5AFF77-D888-4151-9C15-15A408709857@fw-web.de>
 <CAL_JsqKfpVVVh6L0PLmieBO3qMFpcDfWFwd+5=qzH_MbeZt31Q@mail.gmail.com>
Message-ID: <4aa7f13e12646722d859ead240177eab@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Mail-ID: 84ed6ef5-32e9-463f-b99c-fd8841002fe1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_131729_305182_2F0A0763 
X-CRM114-Status: GOOD (  20.17  )
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

Am 2024-11-06 19:39, schrieb Rob Herring:
> On Wed, Nov 6, 2024 at 12:34 PM Frank Wunderlich <linux@fw-web.de> 
> wrote:
>> 
>> Am 5. November 2024 17:28:57 MEZ schrieb Gregory CLEMENT 
>> <gregory.clement@bootlin.com>:
>> >"Rob Herring (Arm)" <robh@kernel.org> writes:
>> >
>> >> While "phy-names" is allowed for sata-port nodes, the names used aren't
>> >> documented and are incorrect ("sata-phy" is what's documented). The name
>> >> for a single entry is fairly useless, so just drop the property.
>> >>
>> >> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> >
>> >Applied on mvebu/dt64
>> >
>> >Thanks,
>> >
>> >Gregory
>> >> ---
>> >> Cc: Frank Wunderlich <linux@fw-web.de>
>> >>
>> >> There's also this 2 year old patch fixing other SATA errors[1] which
>> >> was never picked up. :(
>> >>
>> >> [1] https://lore.kernel.org/linux-arm-kernel/20220311210357.222830-3-linux@fw-web.de/
>> 
>> Hi
>> 
>> How to deal with my patch pointed by rob?
> 
> I believe it will conflict with mine. Can you rebase on top of
> mvebu/dt64 and resend it.
> 
> Rob

i have rebased my patch [1], but it seems there are much more errors 
there (which i tried to fix there too).

To be honest marvell is confusing to me finding the right file to patch 
because of many dtsi files included by each other mixed with some 
macros.

at least some properties have to be documented in yaml:

arch/arm64/boot/dts/marvell/armada-8040-db.dtb: sata@540000: Unevaluated 
properties are not allowed ('#address-cells', '#size-cells', 
'dma-coherent', 'iommus' were unexpected)

sata-node itself seems to be defined in 
arch/arm64/boot/dts/marvell/armada-cp11x.dtsi (adress/size-cells and 
dma-coherent are defined here)

iommus seems to be added with
83a3545d9c37 2020-07-15 arm64: dts: marvell: add SMMU support Marcin 
Wojtas  (tag: mvebu-dt64-5.9-1)
which seems not be documented in txt before i converted the binding.

so something like adding this to the binding:

   '#address-cells':
     const: 1

   '#size-cells':
     const: 0

   dma-coherent: true

   iommus:
     maxItems: 1

dma-coherent was there in my version and seem to be broken with

6f997d4bb98b 2022-09-09 dt-bindings: ata: ahci-platform: Move 
dma-coherent to sata-common.yaml Serge Semin

but maybe i only get the error for it because of my call with my yaml 
only

ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make dtbs_check 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/ata/ahci-platform.yaml

adress/size-cells is strange to me, i'm sure i tested the yaml against 
the example which also contains them...i guess it was defined somewhere 
else.

and this one:

arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: sata@540000: 
sata-port@0:phy-names:0: 'sata-phy' was expected
	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#

i guess it is taken from here:
Documentation/devicetree/bindings/ata/ahci-common.yaml:107:        
const: sata-phy

if i understand it the right way then if phy-names is defined in 
sata-subnode it has to be value "sata-phy"...so basicly somewhere in the 
chains of dtsi's a phy-name is defined to another value..am i right?

it looks like it is in 
arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi...if i drop the 
phy-names for the other sata-ports (below cp1_sata0)

seems dropping them were missing from your patch as you remove another 
one in same file (&cp0_sata0)

please correct me if i'm wrong

regards Frank

[1] https://github.com/frank-w/BPI-Router-Linux/commits/mvebu/dt64/

