Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF26E83040
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 02:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kdn9dIfswRCpDLgnVnh/lGDwlTKGgmWuruqmpoNcLo=; b=rVLzNWJa/CMt+GGDwUqCRDjCJ6
	CPqRvh4+qFR6Q+bcV3MM/vYofc5zf5tCqCuQhFqU/rDUUcDoXF3MS3BsrwowQ6Qf1chK8M8V6Adp2
	WGHyxVU88wyy2AvfG/9IJ++xIwbtBnSe9TUJuK7/cLJoSpv5PWA32+PTE45mKl56+GysMPraDaPFe
	VPri87s1VZJFPYBQdqjjVgUMDHFvuYhMIh81JbKP7r51B4piwPFJNyqcHQnF9GHcww6XD9RGSHV4B
	DVv55xN+LKf7Oy3dcseBPCmEpG2j5oKZa4WZJcULjHoPOdP8m9oZVdbL4tuph643PWYKuPIxbUet4
	xz3suV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6bn-00000005xp7-0u2z;
	Tue, 03 Feb 2026 02:57:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6bm-00000005xp0-1TRg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 02:57:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB6AF60010
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Feb 2026 02:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7068AC116C6;
	Tue,  3 Feb 2026 02:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770087458;
	bh=k9cR3G+PJSfE37UeQ68RBhjrTADJObLs/02JvNcFNXA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=YndZp4oSlflNB1o2wkRKHVU1ddKVbVpgqMXnGRFJqYZVaURxFHlhn3wOy7HfMzTp/
	 GGkBBG+4ClVyUAnTmSQRnXeicXoAOAUMizl/mezeWINvfRC2+G1QRyFDgxMWK+w7bL
	 c7V9E/eqjdrb7K7TVeVWljYdIRaLZOltDfSd51s+DX4cp8t4OTuhvGdGrAB8R9bznT
	 9KgDyr7cSUgzjwIMmILI4Pj6mv/FXjG6X/G9KsL1UDIGRQEPFa1wFHCRsyVMWLW6lS
	 Ytuv1GlLBwhkI805Gw3ymeqh5VrP8AGlBqBJ/hyFiZSUhs9ghZq/5U06zSkoN1atu6
	 13wAXaYO36XBg==
Message-ID: <bc4d75bd-3d72-42c3-93bc-e9659b36f1bb@kernel.org>
Date: Mon, 2 Feb 2026 20:57:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL v2] arm/arm64: dts: socfpga: updates for v6.20, version
 2
Content-Language: en-US
To: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
References: <20260131174656.30403-1-dinguyen@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260131174656.30403-1-dinguyen@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 1/31/26 11:46, Dinh Nguyen wrote:
> Hi soc maintainers,
> 
> This is version 2 of the PR that had dt-bindings for dma and mtd patches[1]. This
> version has those patches removed and I'm taking them through the respective
> maintainer's tree.
> 
> Thanks,
> Dinh
> [1] https://lore.kernel.org/soc/7c6de5dc-8396-4793-a4fa-184bfe4096f3@kernel.org
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>    Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.20_v2
> 
> for you to fetch changes up to 42a8d7d72185247c0bbada1d2c44bef743ee6a5d:
> 
>    dt-bindings: intel: Add Agilex eMMC support (2026-01-30 09:50:07 -0600)
> 
> ----------------------------------------------------------------
> SoCFPGA DTS updates for v6.20, version 2
> - dt-bindings updates:
> 	- Add intel,socfpga-agilex5-socdk-modular for the Agilex5 mod board
> 	- Add intel,socfpga-agilex-emmc for the Agilex eMMC daughter board
> 	- Move entries in intel,socfpga.yaml into altera.yaml
> 	- Add syscon as a fallback for sys-mgr
> 
> - Add dma-cohrerent property for Agilex5 NAND and DMA
> - Add support for the Agilex5 modular board
> - Add IOMMUS property for ethernet nodes for Agilex5
> - Use lowercase hex for dts files
> - Add #address-cells and #size-cells for sram
> - Fix dtbs_check warning for fpga-region
> - Move dma controller node for Agilex5 under simple-bus
> - Add support for the Agilex eMMC daughter board
> 
> ----------------------------------------------------------------
> Dinh Nguyen (4):
>        dt-bindings: arm: altera: combine Intel's SoCFPGA into altera.yaml
>        dt-bindings: altera: document syscon as fallback for sys-mgr
>        ARM: dts: socfpga: add #address-cells and #size-cells for sram node
>        ARM: dts: socfpga: fix dtbs_check warning for fpga-region
> 
> Khairul Anuar Romli (2):
>        arm64: dts: socfpga: agilex5: Add dma-coherent property
>        arm64: dts: intel: agilex5: Add simple-bus node on top of dma controller node
> 
> Krzysztof Kozlowski (1):
>        arm64: dts: altera: Use lowercase hex
> 
> Nazim Amirul (1):
>        arm64: dts: socfpga: agilex5: Add IOMMUS property for ethernet nodes
> 
> Ng Tze Yee (2):
>        arm64: dts: socfpga: agilex: add emmc support
>        dt-bindings: intel: Add Agilex eMMC support

Please disregard this PR. I made a mistake with one of the patches. I 
will send a follow-up v3.

Sorry for the churn.

Dinh


