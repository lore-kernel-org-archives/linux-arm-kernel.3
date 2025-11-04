Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAECCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1hWH3+AR/bg3QpRh8gvwyFU649vBca22dStUU7iirU=; b=QbjOp1mloawnKOO4cgRX/DLR4P
	g0Ai2lzII+CKjR2lVDxQQk1r7Ibte48cdNFrbu3oMabZrDqt0lNWsIuWd1s3C9dUVuIbawwRXb0wx
	pWkHiPEECd0WWeA7MPPk8KGM7GOP1GCjT748TpfMfjnwD+HlEOyEIOefM/E2kshsnt7wf4BqADl3d
	2PnxgDqQ2eitI/za0AGgq0sybST3b8yEiRcA9C09t2oqOrpkQY47+XeJ36zRVawN27tbn90ADslnJ
	D+3MSnU84cKYAsCYJvbsCDxjjQQTOk0qSlMTUdNlgTHR8y/cmw401MMiJpV17wbDpSZILV5aOS6kH
	NjVMfEew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCJL-0000000BPeY-1PPy;
	Tue, 04 Nov 2025 08:22:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCJJ-0000000BPe6-2mB6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 08:22:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C8FE1601F3;
	Tue,  4 Nov 2025 08:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D539C4CEF7;
	Tue,  4 Nov 2025 08:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762244556;
	bh=ReIHYoZ0hfuPqjEQELfx5zZWt5YlSXlsiSnCN8jUknA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZPbwNonw93eAJJvAlPi5vo8zgVf76U06SpHwN8KcdItl2PD2A2gaGXwc6ZjgWx4uS
	 wb801lM9uqwgMc0JomOoA+VmFd+G2mvXpEZ7ddbT+wQyqcrhMHOEgeV27krAw5KbxX
	 2KU2rKAJO6ZuWiiPrrm3YwlXeVMwGrBbz+YyXho3rjEu3tuVIIx0UkuFxytgLmMNz2
	 kyB0Gott5qFfuh3RI6jNeECSOkrtWGvlhrjJPzyTzGSjBJPfqEWZi8NYgsp60vA8P9
	 U6ERelUNMVbVP8VMRNGL/KQAVcDzR6CzGYZf6c80bCUP5jdkTwl8Sozrpz1aOogxMg
	 OjSVmzxjry5xw==
Date: Tue, 4 Nov 2025 09:22:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Shen <sjg168@gmail.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	peter.shen@amd.com
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: Add compatible for
 Facebook Anacapa BMC
Message-ID: <20251104-mellow-denim-dogfish-4affdb@kuoka>
References: <20251103093320.1392256-1-peter.shen@amd.com>
 <20251103093320.1392256-2-peter.shen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103093320.1392256-2-peter.shen@amd.com>
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

On Mon, Nov 03, 2025 at 05:33:19PM +0800, Peter Shen wrote:
> This patch adds the compatible string for the Facebook Anacapa BMC
> which uses an Aspeed AST2600 SoC. This is required before adding
> the board's device tree source file.
> 
> Signed-off-by: Peter Shen <peter.shen@amd.com>

Still broken email/DCO chain. Run checkpatch BEFORE you send, not after.

Best regards,
Krzysztof


