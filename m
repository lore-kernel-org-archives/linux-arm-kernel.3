Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58804E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOQ1jpDqY2O9HdhPjGYRjmWc1cMH9PK1yQq7dZwMKCc=; b=CqcHxyRzSNRESp5QGEA/4kkEWU
	zx+2dJEifyFZkdaUhBNfm0JlpoH0WJUzer5a/CfJxKyXpcGeuqo8pTA63XjpN1IwU+93825Iodb0P
	lpuuTEDAyiet7B/lKyfsdatrc8N2GBhW3xRRUr+ibEPPPiiyAhv05r9QL0E98b7C0ZlYhqogL8X8J
	LuqWqmXI9hrmVkhMdljpfHaJrrXBnf0DhSfy/VztcpDB0H3a1a3EPSiby/SiCgDxVUe0XT2ove8ZC
	V5E7NuK8DNyl7hBnRwcZXJ9lYtWZj/6XC69DZSnuSi0gxnTsCKKz1CNt3W8SAXPK9aOYsrFHULgbT
	xbR6kdOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJ5Q-0000000ER7j-0zYZ;
	Wed, 11 Dec 2024 09:32:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJ4M-0000000EQow-0e04
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 09:31:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0D99DA41F59;
	Wed, 11 Dec 2024 09:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875DBC4CEDE;
	Wed, 11 Dec 2024 09:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733909505;
	bh=JNi0/3oudx6uDms5WbJLo0swIVqX1h8w+/7VjhgYUGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvWqNMMXvUhTvZWxgzetbfm6yY3dOIOEBxzvPnoz8/rM8f35CW41AWsUko76vGn0W
	 gxAIsC1oHBcU61LVKG1Befs0jxv3rey4zg8jglsnGTEbY2/dHpyVxZoMaKvtyGxBd9
	 qHIgcXyNAGNBEuIg3bznfrMYmzQmeXaXMAwVc4qxDebrbYQxSCyRx7NLiRjJY6Fv3p
	 nJx4fiQlVzK5akanxGBIVKOqu19SUl4x/3KO1iTuvdQUJgieGyZNG0IqRqJntyj+GP
	 ly4ne6+N5h8xCzgSiLG5HHCrbQr4fudCr7dQMwa2RzCo5H/iXKkRaYZox8RweQpx5G
	 Bk4kqeJXcE4Vw==
Date: Wed, 11 Dec 2024 10:31:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel-lvds: Add compatible
 for AUO G084SN05 V9
Message-ID: <yujvdu3s6v7z7th2lrdscqfxocx2zy2u4owakisvnjppz2udqv@5ok2rcf4exd4>
References: <20241210105705.116116-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210105705.116116-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_013146_251564_21B3628D 
X-CRM114-Status: UNSURE (   9.66  )
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

On Tue, Dec 10, 2024 at 07:57:04AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The AUO G084SN05 V9 is an 8.4" 800x600 LVDS display.
> 
> Add a compatible entry for this LVDS display model.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Added devicetree@vger.kernel.org on Cc.
> 
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


