Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E153EDA68D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4X7TqO6aR9T/o1yrqQM26ZnNsrnGcQ0asY7t4gRxW8=; b=aK0F6XfrpX+3JZyx4dp7CxVEVI
	pldw9qIQ0LQhlh74/DVibvuvEqMWfGtYvBMluLEChTk2PSfh2+YkIpavstF0lkHtiQpB6PdGRcVcR
	SAIF4F4oMu4S39WOX4B25A0Z5UFSvnMHlLAmTpbvm3TnlGzq4ITczKYiL+20l/1CMsJPR9rzh1B13
	aXdKhbOD7WekdhYGdJVoaQBlRwLoasyVWp366aZhR2xTNyBQBS94PoQ8cDOpraZ0kezHnvpZarYFT
	059KNVd5LEgwqLDX3VEOVRvpMDEkunjTRUdxjZW/xUKPNOOd7XtGbOWJqvU/uWegoljghJo0TvO8n
	KVsmJvGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSp5-0000000Fb8u-2l4H;
	Tue, 03 Mar 2026 16:42:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSp3-0000000Fb7k-0v7G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 16:42:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 765E540B35;
	Tue,  3 Mar 2026 16:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4F3C116C6;
	Tue,  3 Mar 2026 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772556132;
	bh=W+8PidUEXESOH6dzGHWWec1+CrSIW7MIlvEsDcbatgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BrkcEQLwzTitTADAopFpz6Wg4ixT5ZNhAmOqz9s4pQvNaecsvaCaMkcquPDXJjCnh
	 uqjh8WWagZn6AaANcJi9qHeIAaWOR3H4SECpEotYfJiF+IOPQaq9LKUWZC1y4VEgIP
	 2KpGAC38/794p0Fp6JiTspiJRcmyKzrZcCtsmEessVrtjBqAo8x6ZCrkm8y6KsJXne
	 1bdP2URXGCQJVVtaN52lEKCslPaZH5pHuv04nQf6uUizy5V4pdp2YKna6e5kRzp7DS
	 Vcb6Pvx537FPyzBP8NS53GphF0QeG1A8+WdFWMLMXO9yyLy5tI2bINBx75rVpCtJ4U
	 c6JvIXGRw80tA==
Date: Tue, 3 Mar 2026 22:12:01 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev
Subject: Re: i.MX8M Plus PCIe link regression
Message-ID: <ac24flkmrooacnpt53swuurkbxvorbjx2yb4s3zdevqua6ddls@wjc3bcsl7zif>
References: <23024521.EfDdHjke4D@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23024521.EfDdHjke4D@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_084213_298251_579A84FC 
X-CRM114-Status: GOOD (  16.32  )
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

On Tue, Mar 03, 2026 at 01:38:13PM +0100, Alexander Stein wrote:
> Hi,
> 
> these days I noticed that there is a PCIe link regression on my i.MX8MP
> platform (TQMa8MPxL) running next-20260227.
> I could bisect it back to commit 9c03e30e3ade3 ("PCI: imx6: Skip link up 
> workaround for newer platforms"). I always get the following errors:
> 
> imx6q-pcie 33800000.pcie: Link failed to come up. LTSSM: CFG_LINKWD_START
> imx6q-pcie 33800000.pcie: probe with driver imx6q-pcie failed with error -110
> 
> Connected is a Gen1 PCIe -> Ethernet adapter. Interestingly a Gen2 device is
> detected without issues.
> 
> Reverting 3c96a61dd2e098dda8dcac3dce3d38a3c87afbfc and
> b9a8d28ebbf118bb3eac953f4a37abbd341257ab "fixes" my platform, both Gen 1 and
> Gen 2 devices are detect. Commit 3c96a61dd2e098dda8dcac3dce3d38a3c87afbfc is only
> required for conflict free revert.
> 
> Here is a summary with outputs:
> Gen 1 device
> > 00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
> > 01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
> > RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 01)
> 
> Gen 2 device
> > 00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
> > 01:00.0 SATA controller: Marvell Technology Group Ltd. 88SE9128 PCIe SATA 6
> > Gb/s RAID controller (rev 20)
> 
> output of "dmesg | grep imx6q-pcie". Common part for all tests:
> > imx6q-pcie 33800000.pcie: host bridge /soc@0/pcie@33800000 ranges:
> > imx6q-pcie 33800000.pcie:       IO 0x001ff80000..0x001ff8ffff ->
> > 0x0000000000
> > imx6q-pcie 33800000.pcie:      MEM 0x0018000000..0x001fefffff ->
> > 0x0018000000
> > imx6q-pcie 33800000.pcie: config reg[1] 0x1ff00000 == cpu 0x1ff00000
> > imx6q-pcie 33800000.pcie: iATU: unroll T, 4 ob, 4 ib, align 64K, limit 16G
> 
> next-20260227
> Gen 1
> > imx6q-pcie 33800000.pcie: Link failed to come up. LTSSM: CFG_LINKWD_START
> > imx6q-pcie 33800000.pcie: probe with driver imx6q-pcie failed with error -110
> 
> Gen 2
> > imx6q-pcie 33800000.pcie: PCIe Gen.2 x1 link up
> > imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00
> 
> next-20260227 + reverts
> Gen 1
> > imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up
> > imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up
> > imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00
> 
> Gen 2
> > imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up
> > imx6q-pcie 33800000.pcie: PCIe Gen.2 x1 link up
> > imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00
> 
> What can we do here? I'm wondering why Gen 2 trains correctly, while Gen 1
> doesn't.
> 

Thanks for the report and sorry for the breakage. Commit 9c03e30e3ade3, mentions
that the workaround is only needed for the i.MX6 platforms. So I'm not sure why
the patch breaks i.MX8M and that too only for Gen 1 speed.

Also, before 9c03e30e3ade3, LTSSM was always started in Gen 1, but as per your
finding, only Gen 1 devices fail to work. So the code till
imx_pcie_wait_for_speed_change() shouldn't have an impact. Maybe the issue is
due to skipping imx_pcie_wait_for_speed_change()?

Richard, thoughts?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

