Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEBBCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 10:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uag0Fd1kgMBtoLUttV8iMv4GBiLGM6xK15wAL/4ggz4=; b=Qx/PlUt5cZ7kWHo1OZPNQg4GNn
	ZWgroGvSOXNXGvWjmUBspD/QQLL+H2sjVlWyzWjWse6xwHiLwCIdeMxEQ4SYFmV7zgJyvDvIK6x0Z
	pdfzVs+gnZofFzvXqrw4X34CYlootqCB01s2TaC/yn076WGD9mhM5BawLUeG7vspT/ug4UoaFEZZu
	+NWjb39QT7gX56CogfPy6EQLZR6I9Egcn7ARdOLl+ynRBcnJbqx00ys96FGEG0HJsL398J8lVoTpe
	khgP2hNK6UeYt328oFf7WSWvZ3WTnD84X16BuBimRE87ikjY7fj7tnZxUXhQ4XQ2m0RoRPCoNX9a6
	1E6CG6FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unb16-00000005Zcq-1xbG;
	Sun, 17 Aug 2025 10:53:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unayW-00000005ZQU-0Lqy;
	Sun, 17 Aug 2025 10:50:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0022E5C4C9B;
	Sun, 17 Aug 2025 10:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1CAC4CEEB;
	Sun, 17 Aug 2025 10:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755427854;
	bh=jYq7d/KI9Fl7n0FN3697SqbIefUMAmBfpP+PbR+dS6o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oOpxmImSwwHJZh3R1upYjow3eW8PAtsOA7LQdCIqDJTVHVgedpn9RuwIKhtL/48o3
	 QFTz4aMH1BRvbIt5iWZ7/eOYz2uUCFbR/ZOqRw79eMLPXXhwJ0uYzkBR1tmu6r06vF
	 7s8wK844/6Z9N2lrFISXUSiyXjeu9oKBe2nVud/8Ov6O/e0ojUkYH1Lm+XkxEe03ai
	 PkUYJRjFLKfrA5V9znZP7/bSpYnKpfz5wggXiTt2PRV0AKAgB/6e6jc/bgWApQjJP7
	 PLLuKXg9OgRc4DfcKTxVGY94iyBRq4rmBPRe3Yjs2KymcarqV0fswaiLJntCpYXqBd
	 XiFgAvFn7zk4Q==
Message-ID: <170403b9-f98b-435c-8403-d1b8c2db1244@kernel.org>
Date: Sun, 17 Aug 2025 12:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: iommu: apple,sart: Add Apple A11
To: Nick Chan <towinchenmi@gmail.com>
Cc: asahi@lists.linux.dev, Will Deacon <will@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Neal Gompa <neal@gompa.dev>,
 Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org,
 Keith Busch <kbusch@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
 devicetree@vger.kernel.org, iommu@lists.linux.dev,
 linux-nvme@lists.infradead.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>
References: <20250811-t8015-nvme-v1-0-ef9c200e74a7@gmail.com>
 <20250811-t8015-nvme-v1-3-ef9c200e74a7@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250811-t8015-nvme-v1-3-ef9c200e74a7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_035056_170453_5BFD0A58 
X-CRM114-Status: UNSURE (   5.19  )
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

On 11.08.25 15:50, Nick Chan wrote:
> Add bindings for SARTv0 as found on Apple A11 SoC.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


