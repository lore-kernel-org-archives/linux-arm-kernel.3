Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F343E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 19:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEQcfrbUYcF1N4UKK0TYqmCVJANB4eKWrWPIx+1vEWE=; b=d8hNqO5ywv1fP2FmPBdu57Ii+g
	sVkLtG81a2Hv3wdaH/W6Oj8j+//9XvI1APMNsxM58fXysYzT+/DVE5FA+ZTbwPlm+lb/XnDV7TQEf
	mXEhCnj/pGrwpcuAl09/sDMZzG4YMB7+0S7By4VkhSEVFL+sn+PzayAu5KJ+i/u+pRO0tJU09CFmL
	3ZF7BVsFKUEMSml/5qi24UgA+Vx0YgdiKF0eAO2wYCh228sWujuKfbWY45qpXvWCIZNWkj1IAnex0
	pOcfE13DEG8uY+HxeLfiUocgDZX0BTX3cfN8GSgV80/AuGs2LUR8NXHM2586IztAnAPXF7z0JeODX
	yCIZmYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUsbp-00000002PlM-2wQ4;
	Mon, 06 Jan 2025 19:17:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUsV7-00000002ONQ-1XLq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 19:10:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C85165C5A51;
	Mon,  6 Jan 2025 19:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718FFC4CED6;
	Mon,  6 Jan 2025 19:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736190655;
	bh=2Y7A97aMbUWW+oSyFhzbH5y7x4SdYncWayLow7TnTOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pg7XiA2IUs1V4wKMOUU7b3qaPJd2WrHbExu/gHdjUU3qv+zp+yl9DiR3elHGduA2m
	 mhav29JdmWzuf/Zz2Jiveb65/a55XcJhQrOdehwJoWdTBfX/uWCdm22BkKlvV/jmjE
	 PzSDaR0go3VHs1cFBgjU3wfGHpciu1pBwfZYHIxQ+hjfBCe0OeoeBEbHTl9iFzyiKP
	 JFThpjyuHsW2xdUe3Pf93JWn50bs/QJwUmuBdB3s5lHdQvnC1mh2xB8c1TDPxVLCFT
	 ZDlvrO6fawpbHjKZ/tx1p9wypQ+CkHtE6Ba2bYLLGrUVEng4vAg8TJbq5bBDzlj0/q
	 S76XCxB+cevvw==
Date: Mon, 6 Jan 2025 13:10:54 -0600
From: Rob Herring <robh@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 2/5] dt-bindings: qcom,pdc: document QCS615 Power
 Domain Controller
Message-ID: <20250106191054.GA820925-robh@kernel.org>
References: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
 <20241104-add_initial_support_for_qcs615-v5-2-9dde8d7b80b0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104-add_initial_support_for_qcs615-v5-2-9dde8d7b80b0@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_111057_444747_526C7A00 
X-CRM114-Status: GOOD (  10.20  )
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

On Mon, Nov 04, 2024 at 05:10:09PM +0800, Lijuan Gao wrote:
> Add a compatible for the Power Domain Controller on QCS615 platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

