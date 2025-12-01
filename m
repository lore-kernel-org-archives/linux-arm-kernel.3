Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A830DD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 17:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=5E5vbE5G1nu3hoj6pyQb/YwRQ7/+MzUndhqBRplsDAE=; b=SUNGyYaPGagPcg
	c1qkaRMo10tjmerMOYmkTVPcbr2CvG9h0w81K5n2Fu9bt5ASsGKMJ5Y3V1TxjalVnIwupUDnQoBC8
	YE/YKwAJWWOpAXDBB+M9A3c/mpf94GUsNQunD5c8ZzWoF1OXr14EfqSFj+RAT5s2Tyg2AOACJi1aF
	eKSidoaLLe/lQXVpQXOoDNV6nAWokZHDq9k6qanhme30yigm7e1jpGnAjSucU1jxVthj3R37PCmp4
	9PkAXHtg+eg90tAhpi8OhYjfHtc8b+2P3QhxCYTpKldihjyjdnmzreRl9Un5FMnNvlvkTG5VdY/FE
	Z/lDdH7PYwJbV7JFdPqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7cL-00000004M7t-04xh;
	Mon, 01 Dec 2025 17:23:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7cI-00000004M7Q-23kE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 17:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F585406B9;
	Mon,  1 Dec 2025 17:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000F7C4CEF1;
	Mon,  1 Dec 2025 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764609793;
	bh=RJqVXuXdZWxWnmtU+9QZzBV2awZeBUdtgRFh+O6fgH0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TFyxWPbs2px1Iud+65mS2POX82bsaaYnqJkjRmi3xOWBZ7wALmu9o1wfevS+xXMQe
	 LqyDxEajoCTCeM/SNrpd29LgxJz23eZE9JjB0xQbb496euGav8iP65KR7ZMFDqsJbT
	 wd67r0ewzxvsY/7S+CDRcZI9xgUbRTRjvIaQ+8xKhggDZtEXePjDNpWmLvO7aiSot0
	 jOxUJNXMOc/dweF8EcE/1FmM/Innu4k8IxAytXDZpC+ryU4hvNcY2O5GElqGlwPfMX
	 QInhJqUmdsJzdxQYZVaO9EbQTruezBJUejdPHRkhSFsZp4qkE6ttt4dkkscealv4LU
	 Sx9Jeu9/4QwFA==
Date: Mon, 1 Dec 2025 11:23:11 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	linux-pci@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: linux-next: Tree for Nov 28
 (drivers/pci/controller/dwc/pcie-nxp-s32g.o)
Message-ID: <20251201172311.GA3019571@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63e1daf7-f9a3-463e-8a1b-e9b72581c7af@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_092314_571862_373482A3 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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

On Sat, Nov 29, 2025 at 07:00:04PM -0800, Randy Dunlap wrote:
> On 11/27/25 9:29 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20251127:
> > 
> 
> on i386 (allmodconfig):
> 
> WARNING: modpost: vmlinux: section mismatch in reference: s32g_init_pcie_controller+0x2b (section: .text) -> memblock_start_of_DRAM (section: .init.text)

Thanks, I'll drop the pci/controller/s32g branch until this is
resolved.

