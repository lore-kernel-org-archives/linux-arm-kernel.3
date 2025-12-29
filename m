Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F078E8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 12:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjFYsTDG269c4guaLpmYC8SN/CuBoT9vM23Sdx0lEk4=; b=r+g1bXC5fepSZvLsl6WMl1hQe2
	/68QeA6Adtj+FbI1Fl7y/zKvHMotmaF9OlJtInY63I3+SGb8V/KBsEovRD8C3K74ok6E8MX9MENhR
	oq7/mEeOp9sqhGkjRabmjioZTF9RVF0ccdqeL9hI9ZfH1olweJ+SfpfcBcsQ3nhVluam/kOli48Bf
	ER59/OGTOfQ3GKFP5uXVx5QdMun/rY5wvt7fg0iqr7drc9LiVHa7MaOfn+MTB+0vVrLp+aA7era7e
	JmVQl6drKc7iTauuLJrmO6LNJ6JVj+259SBJgsxvYlHLnqJ90IdNLl9lt8VgnT9+DsUA1zX1M5H+P
	NSeZ/cSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCeu-00000003hpx-2MRs;
	Mon, 29 Dec 2025 12:47:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCer-00000003hoO-3SgR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 12:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 431FA4443C;
	Mon, 29 Dec 2025 12:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8127C116C6;
	Mon, 29 Dec 2025 12:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767012453;
	bh=G7pASx97A/vPemlyhC2nxadymqrPJddcRTFYt0vkuOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pH24rT5bBJJ5xtokWlKGehd/didNyCmO2gKC+ll7JQlKZnxJG9hqmzZL15MZFtSj0
	 ETPXd5YHBgTBPrEawpTi4Z54JIG6wLiMkdf3Jos0LzrjkuWahNWhhFhZwxfqRLr40D
	 flH81jb+lllhSLyQPCAxqkPBW8O60aj7dMR3Kf1oQcZydT7KpuvKK4jn+YwF7BX9gg
	 dYG0OEkeKfyyJ2XbfVtrO3anN5R9ucNb54RlqFq38JtMhxZPQhdWnRZ/1w6sNi0nU5
	 Ue1NbT+/hjgNzpDoMos/C2OiW88w99dJxqTUfDe8PoE2JY8599TNjc5oZrE4jlQ6CH
	 sPDXHoTzVhyjA==
Date: Mon, 29 Dec 2025 20:47:27 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: tqma8xxs: replace 0 with IMX_LPCG_CLK_0
 for lpcg indices
Message-ID: <aVJ4X5-Ra2W3hhQy@dragon>
References: <20251121073142.3367642-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121073142.3367642-1-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_044733_881032_FA3C2C0B 
X-CRM114-Status: UNSURE (   9.08  )
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

On Fri, Nov 21, 2025 at 08:31:40AM +0100, Alexander Stein wrote:
> Replace the 0 with IMX_LPCG_CLK_0 for LPCG clock indices. Although the
> numerical value is identical, the LPCG input is defined as
> IMX_LPCG_CLK_<n>, so using the symbolic constant improves clarity and
> consistency with the LPCG clock naming convention.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!

