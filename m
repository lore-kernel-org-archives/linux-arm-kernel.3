Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91757CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrtxNVHwTJ4oyryUvdf8ihpCH/wC7AM/4lz7xfEKLZY=; b=rqLkEJzUSL6d4igVx/B3GFjnu4
	C/ZCDxS0lDlVbYGRe4cwpTGq/vmUYv/0g9wB1OsMBgT0aVAnq+tZZesIpWqxIPuLES/z/XAjDhrdt
	DoUyJjaDBzNdgLe7Ogmfy0SI+X7OeJQvnTs4ibyP2piXF/aHpqDUXrZhOtSdSUXE5BCf8DnH68554
	fNIXzT6N6ayW7Fi0z6OBr5hn7RUHnZfS9VjvdAaTftAICsIb2+LVtTbPlcZzp9Muj7mTJWAXfZTgd
	28ckFffYMnKEW1l1eadysfo0Mj+tQXNH6wGf3zM6xZpuoVwg3FsFVXESHSuI252vfH+ICv1SVb00t
	D6cIO1hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtnF-00000005b1J-2Sh7;
	Tue, 09 Sep 2025 08:33:37 +0000
Received: from mail-m1973173.qiye.163.com ([220.197.31.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsUS-000000054M2-3taf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:10:10 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 222bd6686;
	Tue, 9 Sep 2025 15:09:59 +0800 (GMT+08:00)
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
Date: Tue,  9 Sep 2025 15:09:58 +0800
Message-ID: <20250909070958.2254093-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179f19c0-d9fc-4efb-bc78-8dc1e7505b13@kernel.org>
References: <179f19c0-d9fc-4efb-bc78-8dc1e7505b13@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a992d4f5a6d09cckunm2b88969717a32b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQhlLVh1LHxlOH00fSRhKHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=XzZSHQbcF9ZJs+G5NZSq2VaVBGuGZYoNSGiWDlxe8Cwqf+CB5cB9YWCziVpWDskPmAZ7avSRJpKDGQAub291cHtmX+BNY9y9tl4tSvuYymgslhONcgfaZ+7aMbdSqqKHJmO8fzENUjWKvd5TVhRNK0vAxvCq8C67L5Qo4+hT4q4=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=WrtxNVHwTJ4oyryUvdf8ihpCH/wC7AM/4lz7xfEKLZY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_001009_142403_7660F067 
X-CRM114-Status: GOOD (  12.58  )
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

On Fri, Sep 05, 2025 at 09:23:48AM +0200, Krzysztof Kozlowski wrote:
> On 03/09/2025 09:06, Albert Yang wrote:
> >>

> > However, I'm uncertain about how to order properties that start with "#".
> > I have treated them as standard/common properties and updated the node as follows.
> > Could you please confirm if this approach is correct?
>
> They go as standard common properties. Whether you group all '#'
> together or sort by name skipping '#' is up to you, because common style
> does not define that.
>
> >
> >
> >             gic: interrupt-controller@32800000 {
> >                     compatible = "arm,gic-v3";
> >                     reg = <0x0 0x32800000 0x0 0x10000>,
> >                           <0x0 0x32880000 0x0 0x100000>;
> >                     ranges;
> >                     #address-cells = <2>;
> >                     #interrupt-cells = <3>;
> >                     interrupt-controller;
> >                     interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> >                     #size-cells = <2>;
>
> I would keep #size-cells after #address-cells, because they describe
> same thing - addressing of children.

Thank you for your feedback and confirmation. I will update the node 
according to your suggestions as follows:

        gic: interrupt-controller@32800000 {
            compatible = "arm,gic-v3";
            reg = <0x0 0x32800000 0x0 0x10000>,
                  <0x0 0x32880000 0x0 0x100000>;
            ranges;
            #address-cells = <2>;
            #size-cells = <2>;
            #interrupt-cells = <3>;
            interrupt-controller;
            interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
        };

Best Regards,
Albert

