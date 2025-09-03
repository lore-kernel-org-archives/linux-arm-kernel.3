Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF96BCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 07:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjx/SD9fZWPHyb/7ICVvucyM/yRi+pwtyYllwjFsIug=; b=L9H48icBmf1PB0XLj8uyJlMeea
	JuW3fS8r5PJmF5AplaSS4CU78+BGci3MXpyo6nlaCSpP6DBsWsE7SDPjpolV8Op45DVDBw6GEeGx3
	XIwG/d5JZRXqfbJojRs/2EzPWWhqhZW5VVMF75hoJM4M57rRz+MLits4KMP/o0VnTStal1vHzNudi
	3d+zc3fGHFbATikjGe1h/VEYel5F4ohrONxekOKTAYyuumLREKGG7+I0/QiKeTFJlocdK9ML1R1+V
	23XqehGhU6zVs2XJMaIZVAOApxDM6/rUwd7FiMFrVtqEh59TcuzMqUT58eoQcT2p8AQlWguZi54iV
	/oTKmjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthc7-00000004w0u-1hkU;
	Wed, 03 Sep 2025 07:09:03 +0000
Received: from mail-m19731110.qiye.163.com ([220.197.31.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthZO-00000004ure-36A0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:06:16 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 218849a75;
	Wed, 3 Sep 2025 15:06:10 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org
Cc: adrian.hunter@intel.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gordon.ge@bst.ai,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	yangzh0906@thundersoft.com
Subject: Re: [PATCH v3 6/8] arm64: dts: bst: add support for Black Sesame Technologies C1200 CDCU1.0 board
Date: Wed,  3 Sep 2025 15:06:07 +0800
Message-ID: <20250903070609.3475214-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <05665d48-72d7-4304-9dd1-1f337235ecd4@kernel.org>
References: <05665d48-72d7-4304-9dd1-1f337235ecd4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a990e65b31c09cckunm437bfbe638cdef
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHRpJVh4aQx1MTRpPTE5KTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=aoR7rtPfSHbE23yYiTQt4JxTxS+8OZupsRlboxYsb979841djEjsBRKPQqRktzu0FtqWiXrl8ZpGcSYkDSZD/lrBXJO+/bF9Hyxe1FH3woXcIYiLAF/clLb5oqEbpIw3zzhciXnBnCRJe80d28yPXjynhCuj6uUjrz2qOHOUvU4=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=vjx/SD9fZWPHyb/7ICVvucyM/yRi+pwtyYllwjFsIug=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_000614_936759_6B8DE9C8 
X-CRM114-Status: GOOD (  15.00  )
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

On Wed, Sep 03, 2025 at 08:14:05AM +0200, Krzysztof Kozlowski wrote:
> On 03/09/2025 05:40, Albert Yang wrote:
> >
> >>> +           gic: interrupt-controller@32800000 {
> >>> +                   compatible = "arm,gic-v3";
> >>> +                   #interrupt-cells = <3>;
> >>> +                   #address-cells = <2>;
> >>> +                   #size-cells = <2>;
> >>> +                   interrupt-controller;
> >>> +                   ranges;
> >>> +                   reg = <0x0 0x32800000 0x0 0x10000>,
> >>> +                         <0x0 0x32880000 0x0 0x100000>;
> >>
> >> Random order...
> >
> > Refs: arm,gic‑v3 binding
> > https://raw.githubusercontent.com/torvalds/linux/master/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
> > Updated as follows:
>
> No, you need to finally read and follow DTS coding style.
>
> >             gic: interrupt-controller@32800000 {
> >                     compatible = "arm,gic-v3";
> >

Thank you for pointing out the DTS coding style requirements. I have now
carefully reviewed the documentation and updated the GIC node as follows.

I have a question regarding the property ordering. According to the DTS
coding style documentation at:
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

The preferred order of properties in device nodes is:

1.“compatible”
2.“reg”
3.“ranges”
4.Standard/common properties (defined by common bindings, e.g. without vendor-prefixes)
5.Vendor-specific properties
6.“status” (if applicable)
7.Child nodes, where each node is preceded with a blank line

However, I'm uncertain about how to order properties that start with "#".
I have treated them as standard/common properties and updated the node as follows.
Could you please confirm if this approach is correct?


		gic: interrupt-controller@32800000 {
			compatible = "arm,gic-v3";
			reg = <0x0 0x32800000 0x0 0x10000>,
			      <0x0 0x32880000 0x0 0x100000>;
			ranges;
			#address-cells = <2>;
			#interrupt-cells = <3>;
			interrupt-controller;
			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
			#size-cells = <2>;
		};

I apologize for missing one of your previous comments. I will address it here:
>> +
>> +&uart0 {
>> +	status = "okay";
>> +};
>> +
>> +&mmc0 {
>
>This is none of the two approved ordering styles from DTS coding style.
>What sort of coding style are you using?

You are absolutely right. I have corrected the node ordering to follow 
the alphabetical style as specified in the DTS coding style documentation:

&mmc0 {
	bus-width = <8>;
	memory-region = <&mmc0_reserved>;
	non-removable;
	status = "okay";
};

&uart0 {
	status = "okay";
};

Thank you very much for your thorough review and patience. I will ensure 
that all future submissions strictly follow the DTS coding style guidelines. 
If you have any additional feedback, please let me know, and I will address 
it promptly to maintain consistency throughout the patch series.

Best regards,
Albert

