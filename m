Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E43F3D5FE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 09:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WF3Kn0ISh9F9yu+8yp7SVHfCNw/qccJQ8SVIItSrE7U=; b=ssX6BGzy7hZU6xKmoL6nyWCnQ3
	ogwT5St0T0uBBE3PaM8Nn/amtBBe3vmaWGDNg9WZ123c9M1CgzQP8HhqQussJwVk0oDmCIXD/cTy6
	oAxRpnFbTst/oIDhdYll4BtjmnevUoW/Rj96gkZti4QbPh5hxEsGZMV5WaKAiExL+BdvYpckOflNT
	ZqInyF22IlYyI+P6wWTfiZvCyWd/JQ0JefHdKSqfErUM6oVHawnZwwur+F39Ll1hjwjPNovdDvIm/
	Bwbgtvtoir4El1J5rpaS92YFF3xPMtaXB7iFjw8EVhh0akcjND+t57ey2BS45LQfxFBFby25VArzR
	KtDi0DKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6mSk-00000009nCx-254v;
	Sun, 29 Mar 2026 09:29:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6mSi-00000009nCe-3Mf4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 09:29:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BA7040467;
	Sun, 29 Mar 2026 09:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763E4C116C6;
	Sun, 29 Mar 2026 09:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774776580;
	bh=0PzeBYmnMXDBQM/NfPtrpKFpSZWm0tnd0XoXBK7IQp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IIe/1T+B0ZxIk8rBC38+iCqsg0EOGLrinCrc5lsNSZueUS8Mu5j/PxTtSpwfWdFLf
	 x/Q9gmABaVMS1kWknP4CPMEIJBc4HOhSoaqXNu+jn5GKcvYQyrrR2L9CkDEBWZ7Rdq
	 68IPTYeLUnfv0dtE2VD01TQ1vYzD2PgY9Quy7Jmxnsnmu7SsZ+bGkx6tM1EoSf2cZa
	 taDau5miJTqc/DgA+dMgsonG/q+43avwk82rjRzzc1w+wxhIxbOXTeJeewFcJVzJzr
	 FAYQSe5fFQ61LKMob0oLxZR8l2lGKGwluiRMNaggYKfwOu/YkOlKjd+E5tMKk3DnFK
	 1sfcIomUPukfQ==
Date: Sun, 29 Mar 2026 11:29:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, vireshk@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: st,thermal-spear1340:
 convert to dtschema
Message-ID: <20260329-pristine-delicate-marmot-e3abc0@quoll>
References: <20260329061523.98346-1-krishnagopi487@gmail.com>
 <20260329061523.98346-2-krishnagopi487@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260329061523.98346-2-krishnagopi487@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_022940_862023_D6D69608 
X-CRM114-Status: UNSURE (   6.59  )
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

On Sun, Mar 29, 2026 at 11:45:19AM +0530, Gopi Krishna Menon wrote:
> Convert the SPEAr Thermal Sensor bindings to DT schema.
> 
> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
> ---
> Changes since v1:
> - Changed unevaluatedProperties to additionalProperties

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


