Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE5DC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 08:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JhJ23PKDGh0rNTPf4+9GEhrGZZAPJDZKUqvEUJMYfY=; b=f8mRTCc32/dR5rHz6hAo7Brsft
	bHF5UkuogYCl2E8GPqmtFF+SERastdmx9L5yDeUYAYfEPK7/ZzWP6bSJCPQKg4rqdMRu4VsE7eQ1q
	Km0EUwopDt+x9PloiZlC6UTtdU6VTgGm9JrAfBBiqxAIhy26wvetvWv9iKthi72W+QSQWfGTKjuo/
	xt/hNzbKotfU/TWlG0KZdb7hP0S/LOe1tNZe2ZGqtnpZ+kltPn515nipugwFpbrtoLwAwDUsjCcRZ
	87fGGHtlUYqD4USFrxIq54Lgirao1Sy1ML9NTeAnIi4MqmACK/1UJz7nJDILNMWN7mX2W0kfEORMG
	XDp9TTWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugg5l-0000000GIqg-2daA;
	Tue, 29 Jul 2025 08:53:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugg0U-0000000GI5w-3xM1;
	Tue, 29 Jul 2025 08:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F1055C60F6;
	Tue, 29 Jul 2025 08:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B402FC4CEF5;
	Tue, 29 Jul 2025 08:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753778902;
	bh=2JhJ23PKDGh0rNTPf4+9GEhrGZZAPJDZKUqvEUJMYfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mNAAoGpN/YY4FI3E9IjMxHdPD0kk9XalVNVAzKrpsR5O3jdpDjrcpf1gyFV00y2b+
	 2kB3X6Wel/4P8A52a5+S/oPsWTptQrti7af0fojd+r7RIbsKtdq88TkGOmzleDfftC
	 L40j/hPxabP0hFKIdZLm2X6p6yf72JrwFd8QtgDCyKk82X/DMB0yYdRYlVp4i4bQke
	 jcz/YOD2N3EAKJfUi/Em2gF1rdVg9hEiivzvzcflPhLz48zsBTV4nrqO5zfoX43Os1
	 ucB0/ejIRjdvNv4Tsg7bUCcNi3OJT/EKp/cgomKb2rc0ITUC+7p8/MjUXvy2JWrBMt
	 Ou+p1ZXShTW0w==
Date: Tue, 29 Jul 2025 10:48:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Erik Beck <xunil@tahomasoft.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: arm: rockchip: add
 LinkStar-H68k-1432v1
Message-ID: <20250729-passionate-jerboa-of-superiority-c7aff5@kuoka>
References: <20250728-linkstarpatch_v5-v5-0-b4ebfeaca652@tahomasoft.com>
 <20250728-linkstarpatch_v5-v5-2-b4ebfeaca652@tahomasoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250728-linkstarpatch_v5-v5-2-b4ebfeaca652@tahomasoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_014823_020816_07A372DE 
X-CRM114-Status: UNSURE (   7.04  )
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

On Mon, Jul 28, 2025 at 11:07:37AM -0400, Erik Beck wrote:
> Add device tree bindings.

I don't understand why correct patch order was changed to incorrect.

See submitting patches in DT bindings dir.

Best regards,
Krzysztof


