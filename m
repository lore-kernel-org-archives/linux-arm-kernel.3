Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF693CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 03:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62SYe2pDIp3VkphXuM3qJYUm0wpI1t1CDBdRSIx1j28=; b=kQRKHpcyj7ibBYb2bC88WgqGEu
	QQtcU2StjVK2R0EaH8f2i1YgmvBH86n2j8/WwbfbQaXoymrYBlMiHGxJUBKi3PMJuSn8GcGgxaGKS
	lJraNcD+WXgT3gbig7kPHuSD9Wu7P6OxQYFYhhlUngzqE4ooErmMwbS0IufOBWEWAKKEoXwsR0PDb
	WyqYTPKD7RZowDG5jeucZJ08Oo1CpL0R+CGaUfqGcEtb/YGpMdwYugFQk69jvSJV7RCjWw7VlUUc6
	L1qYEh4moH1weGFZYVRhLeZeFna8vFgfaq+1B1932r+ti5Y08W7YFnwEZAEq0Y/39YqLhImc+QUql
	j7B/3gpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPXfU-00000001yiE-0yE3;
	Sun, 30 Nov 2025 03:00:08 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPXfS-00000001yi3-27YF;
	Sun, 30 Nov 2025 03:00:06 +0000
Message-ID: <63e1daf7-f9a3-463e-8a1b-e9b72581c7af@infradead.org>
Date: Sat, 29 Nov 2025 19:00:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Nov 28
 (drivers/pci/controller/dwc/pcie-nxp-s32g.o)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linux-pci@vger.kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, linux-arm-kernel@lists.infradead.org
References: <20251128162928.36eec2d6@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251128162928.36eec2d6@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 11/27/25 9:29 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20251127:
> 

on i386 (allmodconfig):

WARNING: modpost: vmlinux: section mismatch in reference: s32g_init_pcie_controller+0x2b (section: .text) -> memblock_start_of_DRAM (section: .init.text)


-- 
~Randy


