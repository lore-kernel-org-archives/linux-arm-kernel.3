Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6F8C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 22:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0afOHm2VhOChq9Ri57ZQvG/dyTGpqiE6JUQmddaXqdA=; b=K+nPh5Dg4MdpMk13w9vqS95IT4
	WXoeopIcEH0v0/T4Yn1Vr6iHz1Eg7gTNhBLhK5jZB/xIc/d/Qpd5s6keWt4/hWgrHGl/FkXzX/OUo
	yXKn2vivufwoliZ+aLpgpLwTkFaWq3bwDAXwRempRgZ4RCRxIL5PnJMdSgAmBOJ7UfEFFt+iXTG7m
	DyM2zTmOmhGQ84Y3uEZmjsFV18wUOAf3QU35FNnC6PC3hps5RELQT+pPfYdRfUs41jHLOXEc1UD6u
	Q6prJxlJLYBm8oGzecnJWvotwSPevL7pKgGWmP/u65ESJBfDgyn1xYtFJJRmoTMXNptfWIlzCgC0D
	GhODD7uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thyOL-00000005QZ9-29FQ;
	Tue, 11 Feb 2025 22:06:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thyMv-00000005QRZ-2wOz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 22:04:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 538DAA40333;
	Tue, 11 Feb 2025 22:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39895C4CEDD;
	Tue, 11 Feb 2025 22:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739311476;
	bh=uMKBhZHWHA8g2rPum0wPT8UZWPSfeTkN6vCMYZZBBBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bhDQssDb3byCKjhbMltioNTDQ3sdU2sd0bLMQPUEgxb7er+DcCAdAlcr5Wf5FuTaC
	 vfACb/l2/oanput6gyBERu8V7jeGDWm3o8c4xJsn5EcA2zk1Ap5QG/9i05+b94YLrQ
	 Fh599IjPljwmp9ARx0TVwXtmQi3c54wAL5aZdHNFG98nXgidVcQdmucKF51NKdhBO3
	 azLdH8J7swmQG3ZGnJa4eAzj+9OsTdFIipA7O4PTumYAyN1QLp5wdXEAIUdpk3nkXi
	 kKWkSnSUCGrr7uO+44ST/KmVan7LzbKs1VmT/NW0uDpidPfsXqJ2XPVElz9E11vPPx
	 XbzBPDb+u/fcg==
Date: Tue, 11 Feb 2025 16:04:35 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ronak Jain <ronak.jain@amd.com>
Cc: michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	nava.kishore.manne@amd.com, krzk+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: firmware: xilinx: Add
 xlnx,zynqmp-firmware compatible
Message-ID: <173931147455.1264295.4744633956351732419.robh@kernel.org>
References: <20250206142244.2553237-1-ronak.jain@amd.com>
 <20250206142244.2553237-2-ronak.jain@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206142244.2553237-2-ronak.jain@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_140437_805902_A493A545 
X-CRM114-Status: GOOD (  10.48  )
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


On Thu, 06 Feb 2025 06:22:42 -0800, Ronak Jain wrote:
> The absence of a compatible property caused dt_binding_check to skip
> the zynqmp_firmware node.
> 
> To address this, add "xlnx,zynqmp-firmware" to the compatible property
> in the example section for the zynqmp_firmware node.
> 
> Signed-off-by: Ronak Jain <ronak.jain@amd.com>
> ---
>  .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml           | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


