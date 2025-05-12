Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B47C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 13:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jlDTWGBmrm12R/qZPIgl88oSzrTVBrWSW+2XeZsOmY=; b=RMWigxLdiGUcgAWXtJrn9416Qx
	Ic8n6IzRv0z9GJZkYLutwFu7kUn00Qmx2PrLzOyAsCvrPN6D5/tXUT6DS5w5ONFjjM7UCb8XIUraP
	AN8I/eh95Pnctn+jzRVtqQl1bQUPhtYWpLTScbT37Y5Uzz1RYPgoOJfDRyE/Knrr/ksBHS6t/0haE
	CqM50s5d5W9hyDws7bYfUHsUqHn7+0SnYOzPfNE8BdjnNEV4oARy0qMzilFHh//IDpUPfn6o83NVl
	lVePnRBrpuhM3snfN1z1Ygi43weznG2Qo/5ocLg4BpOffpGAkwwK/iipU+KaVP/ONCcrtncULAdGq
	5TjwUE6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETAI-00000009XiZ-3QTG;
	Mon, 12 May 2025 13:25:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESe2-00000009RmZ-0XwT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:52:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5A6A7A4D130;
	Mon, 12 May 2025 12:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF990C4CEED;
	Mon, 12 May 2025 12:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747054353;
	bh=8ZmiWEvYDdcWO94VvVuvtMz1yjFZ7HIfQWAcdyV8D+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RAfVIzWsPVZm7gw396VeBjXGD+0F9G4XAL6WIXJE8dCziqLBFcDeROkJqAOOl0aig
	 I9JplluoHJnSJ20Y+OE4pcJuzeX+d/hesUp2uqs7zql+0JEwvvaHXR1IwD3qrhfoJG
	 WDQPeqRLc1gbUAe2HubdoWqxa/GduSgKWc0Jfvuh/hci39QKmYjBlqs7cFSMkalAGK
	 ideD98/y7d6jMLrm+MLy67iGXwT7Om9+UF0U5WnZY1sjPy9ZuXpqAMyGC6pjaP6XLi
	 Hzq5PiaYciW7O1O1aEd7uUxYYjY6kuKHJ8iRR0/7xLdQYQsW926fwweDjYiZsOx0sq
	 xYjZyYXOv8XWw==
Date: Mon, 12 May 2025 07:52:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: fsl,qman-fqd: Fix reserved-memory.yaml
 reference
Message-ID: <174705434967.2948939.9106067871185056281.robh@kernel.org>
References: <20250507154231.1590634-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507154231.1590634-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_055234_233745_137D7305 
X-CRM114-Status: UNSURE (   9.79  )
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


On Wed, 07 May 2025 10:42:31 -0500, Rob Herring (Arm) wrote:
> The reserved-memory.yaml reference needs the full path. No warnings were
> generated because the example has the wrong compatible string, so fix
> that too.
> 
> Fixes: 304a90c4f75d ("dt-bindings: soc: fsl: Convert q(b)man-* to yaml format")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!


