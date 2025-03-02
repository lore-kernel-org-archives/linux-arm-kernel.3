Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96745C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 10:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1HofxqZHSTCUpd5lOeDq3SBTtMIiVBiNXKqhmbdBgc=; b=gvcncYcmUrNqZDG5h8lKgGriRY
	hO4dfVb4rNCIfSVJkoSMPXInVX4X0Cg70Mh0uzsTD4kRh0lwOplIaKWKI/UDSYOrkiV0N0I8EBGpU
	4E0eR3JizEwvoCv4tsS3W76fXNVSfu59a9CMTpKAmvB+oUoiDnPKEWaB+l39Gf00BQR9aWH4jOoXU
	MrZfdQqHC90MFllIJUo8jAWZLihobQQL+fYXe/QSRbubkiU9/5s/Ku2ROek3su+puqaFCnNmucnDU
	C4jGwGHlXn+WkP2pY75ag1UiNh7wy9D1/AbOqX1ZJPERr2eaq5AGQcRlKZWi+hcNxn1OlpO4zCFEW
	Qe+XWEZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1togfM-0000000Fobq-0EIF;
	Sun, 02 Mar 2025 10:35:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1togdo-0000000FoRE-0s1e;
	Sun, 02 Mar 2025 10:33:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 142A45C3D84;
	Sun,  2 Mar 2025 10:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C76EC4CED6;
	Sun,  2 Mar 2025 10:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740911626;
	bh=5igBtm41WVG9TfJJgntVRppVAiT8ZGfFHmRjD2xk044=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=blNeppaTMVaj6wEh0CVmk9YH0lmIp4rBf4CQNZ90ZosIELmjV1e1J3bnxznAfZgbJ
	 pQlXiPsr9lm2INxgTcGMTQEmmJ11Z9hWK+BJ73phJz82KO1NNI55b5O85hlI0SLSH0
	 TgQ5hAbpl2WABdwnWKgfSJegPcYfJtK9doju1Do3HWtXAgiYjyshLa2P0qBxubB81k
	 poR31rtN4Td9H4puP2Q5D3t/j/T2i2regN1sLYRuq1imnIpusGnsda1Cm3p5z8uOz8
	 Emr8TQntVC7lx7JG3muKVmz2NoqTSOtETb5Iw9cRKQeYrTpLQXxLj9P3bALvIanZba
	 tAv0P68bcDFPQ==
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fe9759e5c1so5631038a91.0;
        Sun, 02 Mar 2025 02:33:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUR2dVfhxnA2xkkbpVpZwqAmU9loG4vpf2ewm4dsBQMljGtNCcdxreJ+enW3CYAm1tdfLFQkz9uvEdiuXcigL6z@lists.infradead.org, AJvYcCUTTo9pqbzw87BNxK8U3k6MN78kUyaRWv/I8ELHMXrInso4OvVpXzpa8SUt7FKjoJkRaDFUX6d2fvSJ/C1uO7s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb1YUhid01yjhvsWSra10k+ovAZ1Ou0UiiKo3E1WRiH2AIdLlN
	GcKEREyjDxJVnJhaUnw9CnZoD0DVYuS01SPLMHz267X2xVplZUj6NQfussBA45nwczMkLEI6pOg
	4kgZz/GQdoW6Kz9XlJmWMvZ3u9w==
X-Google-Smtp-Source: AGHT+IE4yOAy4wKEhTzGzHrtS4sGrkbKCLya/s6+oGg2/VOrOdOUVnYPATsFzlyBtOl0Sgc3vtSnbz58G2fw2hekZNg=
X-Received: by 2002:a17:90b:3890:b0:2ee:aed2:c15c with SMTP id
 98e67ed59e1d1-2febabf19a6mr14172100a91.28.1740911625947; Sun, 02 Mar 2025
 02:33:45 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-2-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 18:34:33 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9GJ9FRLZVu3EguCKHipK7SfwtVKJtm2cjTSZPTMzz7MA@mail.gmail.com>
X-Gm-Features: AQ5f1JrYwE5Hn_kv29jSXXxzOoJp6L1YscuJYu18bGgxJ2qo6QWbanRGU55J3Ts
Message-ID: <CAAOTY_9GJ9FRLZVu3EguCKHipK7SfwtVKJtm2cjTSZPTMzz7MA@mail.gmail.com>
Subject: Re: [PATCH v7 01/43] dt-bindings: display: mediatek: dpi: Add MT8195
 and MT8188 compat
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
	jie.qiu@mediatek.com, junzhi.zhao@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com, 
	ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
	jason-jh.lin@mediatek.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_023348_360620_4E32806F 
X-CRM114-Status: GOOD (  11.90  )
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B42=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:=
49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add compatibles for the Digital Parallel Interface (DPI) block
> found in the MT8195 and MT8188 SoCs: inside of the chip, this one
> is directly connected to the HDMI block.

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 0f1e556dc8ef..5670715efa5c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -27,6 +27,7 @@ properties:
>            - mediatek,mt8188-dp-intf
>            - mediatek,mt8192-dpi
>            - mediatek,mt8195-dp-intf
> +          - mediatek,mt8195-dpi
>        - items:
>            - enum:
>                - mediatek,mt6795-dpi
> @@ -35,6 +36,10 @@ properties:
>            - enum:
>                - mediatek,mt8365-dpi
>            - const: mediatek,mt8192-dpi
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-dpi
> +          - const: mediatek,mt8195-dpi
>
>    reg:
>      maxItems: 1
> --
> 2.48.1
>

