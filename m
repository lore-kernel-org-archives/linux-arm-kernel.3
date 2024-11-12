Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2034D42BBA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 17:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSouGHEW19DomnyQlOFZy8WnihmOj5qulEWHDVgY7J0=; b=oRMYGn844XuG1Y7/33ilB9rVzj
	aBuhRUijDUfEQnxFBNFgDxEOnFGv0X89AvT7ObdejCT17lTEXS/1so3HDbNF5rq2eXhUpyM2F3LQO
	sN1WGHmq1YT84f5aNqpx+DR1/DCXwTlFaZHR7yUcc2TNEThyDtF7twzei7dmCNfjMtwAQk/Q0u8QM
	v/uxSxkmiDmERY+TDN34msKrRRQDxS5vlrKU6j8KKMVVlkh7SBF674VH/gj/yXWaamVYccASzxW+H
	02O/d8Ywwz9jU0/NntU8ijb3pIbsZ+FYBu2QRdWinIawYEkwVPR9EXoTFsNhjSdde8M65E5FV6PdX
	9QnJXzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuz8-00000004QW3-3vxd;
	Tue, 12 Nov 2024 17:47:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuYj-00000004L6g-0FoA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 17:20:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E72C5C5532;
	Tue, 12 Nov 2024 17:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E38C4CECD;
	Tue, 12 Nov 2024 17:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731432008;
	bh=kxq+Qvpdqa/9pRVF0zI8u+S3KYrRUl+SKH9LeS3DpkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRyKbtQtD8NAKajudiu2KWgR4VZpUlT/8Qgfzw+XVK01L/f+kGeImeLxFwlIsHI3s
	 d4803isCaNZahYJDHsGYnOOJN2hChGvnts1cFG0goR5b0tsMZEt27iqk9vC66LdbK5
	 U5RYMSL7snOeoqILBRtX4j82EEFTFYhEaYJRd/cAQmnP6lsZjlF5llzrH0ZMGY9xDk
	 OtMGqvQGe2twSC/7UK+ix7lJFLbYXF5F7C4iF9SF2ZknY6gVp+YJS95C/FYx2StVll
	 0K7CDt+q+5oOo5/8Ov71mepdTxLAQnuMmGCuUpws/Ne6DoYEsEej49gLqFSEuDUWBa
	 tVtdQEbZf0/iw==
Date: Tue, 12 Nov 2024 11:20:06 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	devicetree@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Document sm8750 SMMU
Message-ID: <173143200549.1352576.7660253310575127437.robh@kernel.org>
References: <20241112003217.2806556-1-quic_molvera@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112003217.2806556-1-quic_molvera@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_092009_170413_D7EC2093 
X-CRM114-Status: UNSURE (   9.68  )
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


On Mon, 11 Nov 2024 16:32:17 -0800, Melody Olvera wrote:
> Document the sm8750 SMMU block.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
> Changes in V3:
> - added additional documentation for gpu and clocks
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


