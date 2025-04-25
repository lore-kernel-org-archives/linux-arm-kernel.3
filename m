Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B8AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4IyYII2sDmXOKPRyDnt0AuZX8m5ZuTYXt3sFL027Fc=; b=4/H089zMGknOLM8JcVHM6hV6f7
	NMq/NAv2H6zmUV90wUHSvntSvtBoX2/ITR6dzpifTp9++EodGv/88hhuHLCLs75TK/5Und2f3TaRQ
	PmnIiTPcRQQYHVuXerBeEb7T/07vtKCUcBA2wR7PbH2SNm+4jRIhHTpfgwrSnbro6fmGZTVixcjPa
	o/6Azu1LgfdD079ZKOJoT2ASIlKlcAASpF0wNmdmzSVxFYx0n/JfBVMb5urXy0kswY5gApqehDAJK
	Y/Ql4c0bkTIrIArBNT3Jck+s3uYZr/6gASLKsdKrxm+ETdAyiisMjSR4+e3lTMNcxL7IH2U1O8Wrs
	URyt51GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8H2R-0000000GvBq-3RsX;
	Fri, 25 Apr 2025 11:16:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FiH-0000000GcJZ-1Z58
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:51:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7997068464;
	Fri, 25 Apr 2025 09:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D4DC4CEEA;
	Fri, 25 Apr 2025 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745574676;
	bh=V4rxOUuu1xK/aFRB+/3OFp+T53D84Mc3wNWfZ+MXMHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uu1hfjbs0hDnXQKQs6VrzYJE7UhH86q0wd6B/AcQ53phcmlPJgLA3RZLeJNOa1rIA
	 +ONs0hyjon1DwP0Hx3kINtoHlh6sSr5dc5jCGwc/SB1qInwEkm8NsdU4FOc2r6oUxR
	 nYxYXesmu7hFjOelGfHW2suVfEUKtSKBy7as8NpcOtDZ1dvtc4e0gunFu2AcJt8UTN
	 xDpxDFWXalj2rbUsVZSFqI5Urtjy85N1Rkk3nDiA4EIhwWKDVaLZ7CLToHh6bQ9xkx
	 CmDk/rj/hSBuXOUOvaCUsdySJ6SJ+tiXA3Amt1N1jt+sle1IXpflNR6qRSjPMI0LXW
	 Hdh/kyNhhvi1w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u8FiH-000000000JQ-1rFI;
	Fri, 25 Apr 2025 11:51:17 +0200
Date: Fri, 25 Apr 2025 11:51:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
	quic_mrana@quicinc.com, quic_cang@quicinc.com,
	quic_qianyu@quicinc.com
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply
 for PCIe PHYs
Message-ID: <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
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

On Fri, Apr 25, 2025 at 05:29:55PM +0800, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
> missing in the current PHY device tree node. The PCIe port can still
> function because the regulator L3J, which vdda-qref consumes, is voted by
> other components.
> 
> Since the device tree should accurately describe the hardware, add the
> vdda-qref power supply explicitly in all PCIe PHY device nodes.

AFAIU the PHYs do not use this qref supply directly so it does not
belong in the PHY node (but possibly in the tcsr node that provides the
refclk).

Since commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
qref supplies") it also won't have any effect for pcie4 and pcie6.

Johan

