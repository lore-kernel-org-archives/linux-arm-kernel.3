Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B232F34C78
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 17:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySJV8S5uSS03dsK9VnD9fW65elFDvvZ6y3Eq544bv60=; b=vfibHU5rD45qBkY0WZpPG4X0QC
	XOMp/SYdb1x6cuiiEec7F7lacvN7JcTK3SQyKTNKaAhUWNVVLsVaOHo+tapUGw0UwsJsiNyL2phc3
	GEtBnxkprTKh3ynGFvj2EMcicicgLpN2TdkondpVHx0KQmMzChlI6CTo4B/TZtaSYqnFeoXNPNlZW
	Bjg9OOd68OEdkHDrijBD286OuP4zDMuqNJwHiVVkRDxvG14WqUkox2/XrrLAv8ZTo+xjnVKUqnd+e
	F6Jwjsuq9OsH6kctjkF7oV8t5bh7fzVPnQsucns4oo0r8mxsKiXvEdQPS7d0CjAzUedAnw9XHQ3g2
	bwmsvKug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCL5N-0000000G8MV-14O8;
	Mon, 13 Apr 2026 17:28:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCL5K-0000000G8M7-4Aao
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 17:28:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7DD244347;
	Mon, 13 Apr 2026 17:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7F3C2BCAF;
	Mon, 13 Apr 2026 17:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776101309;
	bh=mqqZU7qX3WkW3Mz56Hb4EU0rPxdufMB8ABltBRDUZmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jd7KiQQqs0DZTve83Te+eNU8yKj3iiSmehCuJK/zEXrzX2zhQub3+gTVqbNhHWNej
	 Q0q+JL8DYgokmJ9fosrF8RLmf+4pTHS5jCOSyzdO+MldJXXvSieOm7c+ti7e78wItv
	 Hi8DX3XSkypJH/g42Z6WcZjkr96ex0z1KsWKuO4dHIIUckwvVDFRYFLmTPqFqZLbJ7
	 3pF7esVReLIlV+k7M95AKoav0ieQngxL30OultcjdURfrGOtgNPAdn7w+P7entGLNr
	 kAxZROAjT067dF68F5OumsC2e2oQ+z06A0Jse8AddYNRQb5XZTrFt42KEsvLBarHsi
	 CUjPoVprv5MpQ==
Date: Mon, 13 Apr 2026 12:28:27 -0500
From: Rob Herring <robh@kernel.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, liviu.dudau@arm.com,
	sudeep.holla@kernel.org, lpieralisi@kernel.org, pawel.moll@arm.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: ARM: arm,vexpress-scc: convert to DT
 schema
Message-ID: <20260413172827.GA3139713-robh@kernel.org>
References: <20260411183355.8847-1-khushalchitturi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411183355.8847-1-khushalchitturi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_102831_053395_55BADC5C 
X-CRM114-Status: GOOD (  10.64  )
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

On Sun, Apr 12, 2026 at 12:03:55AM +0530, Khushal Chitturi wrote:
> Convert the ARM Versatile Express Serial Configuration Controller
> bindings to DT schema.
> 
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
> ---
> Changelog:
> v1 -> v2:
> - Modified compatible string to use an enum instead of a generic pattern.
> - Updated maintainers list.
> 
>  .../bindings/arm/arm,vexpress-scc.yaml        | 53 +++++++++++++++++++
>  .../devicetree/bindings/arm/vexpress-scc.txt  | 33 ------------
>  2 files changed, 53 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/arm/vexpress-scc.txt

Applied, thanks.

Rob

