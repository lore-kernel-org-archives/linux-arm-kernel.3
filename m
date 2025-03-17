Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D1DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 09:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olOSeqyFvLZJ22LOKLQzX5hVl6+fQaIqyTnNhGTHkEU=; b=qu7lCWTVXsqqANvdXlvcpP3Y2a
	RR1oIhxaZT0l6rrRJeQP2aIwB7s0nGn1DfU3kfQeWGcjcfNMt4eV91aossAntXYhUNWz0UjsHXlRV
	hYqjECNtsW5NWdrt3McwqXnMpixiRko6dGnnXyIoxVUWHe+rQt2zGCgKjzt+2FsMbNiBAAKfIiW2a
	5Ojj/WHWX/xC7QDFDx7X76kyOrCGlt5UNnGH81F5aJ9vBdF+W5oS9/FBlZp2dxpkBW44+NWUb0luf
	rm7pTe/kw9QNHkqgXSwWEtmCjHuURPUTdN5aJLeQn0P2lm8bJ40RWfNSkG4Wz14jeP8s+wSYULLxT
	ioeFottA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6Xm-00000001sdD-2tLh;
	Mon, 17 Mar 2025 09:13:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6W6-00000001sJn-1hSE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 09:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2B1F5C53EE;
	Mon, 17 Mar 2025 09:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A342CC4CEE3;
	Mon, 17 Mar 2025 09:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742202733;
	bh=qIi66nAJAkuAxof/+NyK+41N8iuL4BfxKI4FIhK+u1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9zA+Xp0IhuHdLpAzNn5wQcFEUuALfNeeC+ADEXYSrdG2dr0CzGltKDfSNv7TGriK
	 xa+DMhe6aYwswcdDVsrTGyLmLVN1roHXa6MHTRukYWM1wm3xFh8h2nOEpRrMAubbgF
	 cj/GffCiF+LqdNvZRKfnHuacqjaEnIEPDcFtPERSf3TfF5kOq+1EcNR4juOWOspkuV
	 yOQTBCl/wwE6q/KPCSEDR7cw/FfuKLU9xdrNrf/jf5TvEpFVu8VNYt5u9wyH9FLFp7
	 qOzrZco6DMF9VCUnLV8zusU7wMpqzvgAIIZGJrQSACOiD5LZKUBS7qak6USSxPDrr8
	 z53XPztZlUb5w==
Date: Mon, 17 Mar 2025 10:12:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kevin Chen <kevin_chen@aspeedtech.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	derek.kiernan@amd.com, dragan.cvetic@amd.com, arnd@arndb.de, gregkh@linuxfoundation.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-binding: aspeed: Add LPC PCC controller
Message-ID: <20250317-hypnotic-boobook-of-discussion-fdfe94@krzk-bin>
References: <20250314112113.953238-1-kevin_chen@aspeedtech.com>
 <20250314112113.953238-2-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314112113.953238-2-kevin_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_021214_527733_3DC5CB4F 
X-CRM114-Status: UNSURE (   9.04  )
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

On Fri, Mar 14, 2025 at 07:21:11PM +0800, Kevin Chen wrote:
> Add dt-bindings for Aspeed for Aspeed LPC POST code capture controller.
> 
> Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.yaml   | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 

Nothing improved. You already got comment that nothing improved and
you... send the same.

NAK

Instead of selectively ignoring comments, go back to review and
implement each of them.

Best regards,
Krzysztof


