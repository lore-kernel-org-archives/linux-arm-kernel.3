Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C925C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 18:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmVKhWHV1XIhOuiLeEKTehgfydMgaye5GexKUHf44Co=; b=gFiC36HN9DOGT04+T5lsut7Xd3
	v9BjSvznYZRr60jJ4aDPi3v3cqpFR1DwbKpNMw80oLPtfcZM6dyzrGDGL6tScvGoOcbwJZ+cp0ltX
	GbLkcGoJfCEiKf6ofSjpP2VhTuy0egQH5lWTCPTqCLWcNrfhXQxMzzgFvM6FFwVf0frzYB/mhja3T
	X54AAcx4GU+FqnwkGQyLxi0OLZngpfkLDAgEqkSa9DUOGxdRAGql7GZHuwlYgH5+mFeXoms+h/waP
	QsGIY+Sg8Y1pvUG9PEkjMFvlTIlUqyiIv+pqUBrNT0wbzog+Z2PPXlkFG2oKdmtMssdnB6MwqsQ5b
	NKThfgFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1H3-0000000GHRz-3mpa;
	Mon, 03 Feb 2025 18:34:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1Ca-0000000GGB9-3uc2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 18:29:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7224D5C6811;
	Mon,  3 Feb 2025 18:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B795BC4CED2;
	Mon,  3 Feb 2025 18:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738607384;
	bh=qRZxlpd4Gjd4SsniUYUOya9umzIMcHMSm2EG0mYUboY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPIS7YKjG7u+XgKlZ2CLHlZ0bSro1K0vrhcQtm2hbBj32M1MY6j7UrEtk49eRN469
	 KJ0Hbe+uaoMq2dAB3dKmaqiw2vsRu1o7sllIyKXF+Lk4NijIida2+3tqIlPjYg42IB
	 TIDWJnDnh1PvbDdQw5QfaLjU7NTZ2Q3f4QQlP1qhh8lSB9f9rIaFmGoythsb264mKq
	 0DILWube6NuE9Y6+G64anwyOpIB52aN6OIXifVg9GLJC+xzC53Z039M2BQsV4xdgtY
	 59bFiSRNFttZzFQnTL6SYVtF/uSFJFonqaBVJrPptVBsbQzy7w/ajsNSdohmB0iNgd
	 CfwMlvwjhAVMw==
Date: Mon, 3 Feb 2025 12:29:42 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	linux-kernel@vger.kernel.org, monstr@monstr.eu,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	Conor Dooley <conor+dt@kernel.org>, michal.simek@xilinx.com,
	git@xilinx.com
Subject: Re: [PATCH 2/3] dt-bindings: xilinx: Remove description for SystemACE
Message-ID: <173860738199.3354889.11453485220913055293.robh@kernel.org>
References: <cover.1738600116.git.michal.simek@amd.com>
 <7ed73455057a5b3ffe9ba00ce27654c296bfdda7.1738600116.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ed73455057a5b3ffe9ba00ce27654c296bfdda7.1738600116.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102945_010517_37419F2E 
X-CRM114-Status: UNSURE (   8.77  )
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


On Mon, 03 Feb 2025 17:28:39 +0100, Michal Simek wrote:
> SystemACE driver has been removed by commit 2907f851f64a ("xsysace: Remove
> SYSACE driver") that's why there is no reason to keep description in
> xilinx.txt file.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>  Documentation/devicetree/bindings/xilinx.txt | 9 ---------
>  1 file changed, 9 deletions(-)
> 

Applied, thanks!


