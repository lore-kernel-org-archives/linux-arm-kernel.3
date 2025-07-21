Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C987C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 00:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDbJhTR7CgsfFVUBebRfTd7DBQrMn9wIBVAncd8AUro=; b=xfN+HX/Abd/KU0+el0iExfNFtN
	kkc0ba+9GHcC1xqBH1SBB4KqNGha/yBugmDdMrKLD9Fn9kuVGg2Qh8EXcmDS4Sj6OWu/5Q0KhCsD8
	cRweHwefqcc3nqL0R0EX5fd6jS3EFODM3Ygg5JBOiqWay5J/qnDCnicuCF+wZZ85q3wSoXxJqO1gb
	nwmJ/fzE6nAgl9Icuxg7PdaHQd8cJKSM1qzr75zqCwH4ZEWpECZLOScSn9DY/KtDZJH2W1YY7mvn0
	20Q8qY8CH8USgYEcHvbVQNOs6RN1sxN4t3LWXswEsTD8aWfflCnfCp7Kjwh18xezJs0FYuR/EDy4f
	OUkkQsVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udeY8-0000000FsrW-3gFe;
	Mon, 21 Jul 2025 00:38:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udeVj-0000000Fsl2-0Uw3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 00:36:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37ABCA52744;
	Mon, 21 Jul 2025 00:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CB2C4CEE7;
	Mon, 21 Jul 2025 00:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753058165;
	bh=gKSahrtOCSt/VKfd9xs5pD7+wJwsmP69I2iSsDQw5Jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SgvaLMV8vSyyb4YaYe8T5Mk3QLjPB/mLj5woIrOlN9iVpS2eZWe1JGrdf5Z3XLDrg
	 SYMf9wYyGN+zML83heWmCvSciJakgxGBj7aRYha/lpSlk+QkoCmpj5NsDFCXy17bMA
	 AlFT1H35PpvdtG7HcSAk/CJ/Nqr3kYhUIZBb7W/DOJ1T7iqUFFEzeqDsvDTgRAyl+8
	 IYPSQqi8NXAVpvqKpy7bcUa23VDSFZX8nn+Ss4EYBvzpjSVOdQRtjUNgtTNWF37HWq
	 s+kfUOhXNumM0OYCQsN7P7M+w/ER4tHcn8m7t1aYuxXXTmhvtqkLEhrVe4o57A0Qcp
	 ZH70Czzi/xQiw==
Date: Sun, 20 Jul 2025 19:36:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: git@xilinx.com, Conor Dooley <conor+dt@kernel.org>, monstr@monstr.eu,
	linux-kernel@vger.kernel.org,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, michal.simek@xilinx.com
Subject: Re: [PATCH 1/3] dt-bindings: soc: xilinx: Add support for K24, KR260
 and KD240 CCs
Message-ID: <175305816440.3147094.10086581132986063188.robh@kernel.org>
References: <cover.1752837842.git.michal.simek@amd.com>
 <8ff66d0dc4e0de6f239c25d43a2a96b4224305e8.1752837842.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ff66d0dc4e0de6f239c25d43a2a96b4224305e8.1752837842.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_173607_226899_AFAE4B35 
X-CRM114-Status: GOOD (  13.07  )
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


On Fri, 18 Jul 2025 13:24:06 +0200, Michal Simek wrote:
> The commit 7a4c31ee877a ("arm64: zynqmp: Add support for Xilinx Kria SOM
> board") has added support for k26 and kv260 and the commit dbcd27526e6a
> ("dt-bindings: soc: xilinx: Add support for KV260 CC") has added support
> for KV260 and this is follow up patch for adding description for k24 SOM,
> KR260 (robotics platform) and KD240 (driver platform).
> The bootflow is the same that's why for more information please take a look
> at above commits.
> 
> The KD240 kit is based on smaller k24 SOM with only 2GB of memory.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>  .../bindings/soc/xilinx/xilinx.yaml           | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


