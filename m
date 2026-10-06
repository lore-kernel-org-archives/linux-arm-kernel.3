Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D519ACA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOznVsW/CgzBqrcV7ubmPIMOIznMySiNCenyt8YgpnQ=; b=V8QM3Pfc4bwmx4iuN5U5defDb3
	NEcL2/NAvQI9iniTk8RT3cURbn+3yXK/7mp4kuPuhwnxkLfIyGg7ohyDXcA1ueVx3iDuAh9EHT0GL
	uFkdcWsUwBOPyIfrpwu6kYSDkL1tDIlsJtXXBwLzhpDlM0skfZV2t4T5uGSkAitBJrRgIEETH7D2o
	hP2UK/SzetyBt3fDgIujA5i+yQ8XpVfBYCEyRb7dNmeSp3iXCq2Ph+BPk1QCdkX/YQMhZjcom+cpt
	A7PIjA+0+DT8b5oLMfxWDodrnr1i1xsUvnAzKTGgr+Ee2vJPaltJQNkCiZjpfbKI1OpHSmGY29MUr
	cijWF4hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7RK-000000014J8-0YXX;
	Tue, 06 Oct 2026 15:50:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7RB-000000014Fi-0dYn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 15:50:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A9DB41FE2;
	Tue,  6 Oct 2026 15:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523C11F0089D;
	Tue,  6 Oct 2026 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791301840;
	bh=qOznVsW/CgzBqrcV7ubmPIMOIznMySiNCenyt8YgpnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lUb9HEhawLT8PJdApbWGXis8LFdZgIekSHddlkgnmkoye75YtvaxqflsfNjU/J88L
	 w8R1RDyZ+KfKocPYaPCrmPSrz357MxEjRgXCxuoDsPnP6KKnzE5cYO3h4fB5Wxeiwz
	 e5NSjdFgofoH9o3zdKY5oohH/oIC8N7gaYa503uSJlLAFNlNpRethewJ6j6FETMmSK
	 aReKhSLuZzSSKuP4m8slu84oPUm5Q8ErroIBkEK3haJ6N7rjj/aAn4dVQoEVtpHUJm
	 cwcVOktbjHp/KQfKwm5I599cCL2Mha8hnfZ5E8pqCaYHGOzb7Hs9ioSM+DYXU3jd7n
	 nAagQ13f8lKiA==
Date: Tue, 6 Oct 2026 10:50:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2
 address and size cells
Message-ID: <179130183923.2392435.12092250762481422037.robh@kernel.org>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
 <20260929-kuno-soc-support-v7-1-530f62dc4020@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-kuno-soc-support-v7-1-530f62dc4020@oss.qualcomm.com>
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


On Tue, 29 Sep 2026 15:18:06 +0530, Hardeep Sharma wrote:
> The QUP wrapper maps its serial engines 1:1 into the parent bus. On
> 64-bit Qualcomm SoCs that bus uses two address and size cells, but on
> 32-bit SoCs such as Kuno the soc node uses one. Requiring two cells
> forces those SoCs to spell out an explicit ranges property instead of
> the plain empty "ranges;" which dtc only accepts when the child and
> parent cell counts match.
> 
> Allow either one or two cells so the wrapper can follow its parent bus.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


