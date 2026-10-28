Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68884606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 01:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Do4JIha7;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b3ojDiQL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MeEhGL9p74hRILnxnbLIZTyexKrQv0qHFAgQnNnxF4A=; b=Do4JIha78H0RV7
	MT45vJEMex6WlUDC6H6USrgTRuGu/71gYqpbeB7Nlm+NcyRLuOwMfRcEiap9blYiE/+SA964xdFpW
	RegF+L3WyajYnbKTXK387y98oG/CuhFke1ZjSfs6Qg9Qqe8eRGA1HokSrdDWKtzDhwzmhlrKo4ABE
	06Fv3Y21BESH44uhoK8YqtxpSGQ+OI0eMoCJ9vUu04stC+jB+ah0njPRym9Hn2Na1amn80769pEM5
	5ewwZvflkAit2wE/vU2t7lgP8d4CQ0bek+Ia3aoG6cGtT6TCJ6b69EJIgnoAv1wbVH5qDtaw+YX99
	2V1msCi2j+ywGfWzaoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsop-000000063cz-1h5p;
	Wed, 28 Oct 2026 01:51:11 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsom-000000063c4-1ZAm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 01:51:10 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2e74a32a07fso562675ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 18:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793152267; x=1793757067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MeEhGL9p74hRILnxnbLIZTyexKrQv0qHFAgQnNnxF4A=;
        b=b3ojDiQLXYNYMBZMO0jCyRiJOoSj6QsK9ETXxKZAmHV3BD8iYMvUMKLWivTLnOaYjv
         pXtYy/VX9q/W3iQQDa5jnKDygdcgZykqzVoU+CD0c5ogSQIGJyS3xpVHfwnNNjDc3wCN
         DW7SwxOFogC27ddCyOGXyqZZ9ayJH00bqfHTzta+NkuMc05mG+VNCMLj+wykWc1yg2Ae
         a21FQLtzM9FWivJFQh8dYj2syRXbDw8Ll8FIy1xncaxaP+ZmMVJMYdQgqQ3juPjcD167
         pEeiZ5LY3JsDqz9p7d0s/5ZyG3lSFnp9lJ9DWs69scDqRESgcN/slTFI7PJdEQlW3AYT
         Gt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793152267; x=1793757067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MeEhGL9p74hRILnxnbLIZTyexKrQv0qHFAgQnNnxF4A=;
        b=jyAc7TNsGaAs03N34ImdQqELi8hbg6VCuBvmGKGO9SK+sSpprJFfgCuqVqkrH+f95X
         RP1iGYg+tL/E83TpNFOVxCr0QoubdfCciI0Q06YnG2XMGRai/9Ko67PuuGG6NP3tpg4N
         NRXzNnDbGFMvSSgQUApA5Sb4PnDs31LMiXcyFK5DEAf0BcUKxPpST5X7hUhLTTVeWJJg
         svuHZLT9hXcxlJvWz5EmvdIjLFGSYsFRK84gaSNNuhbZf3LmBOsvFiDMcQ3A9pTouaxo
         T6yvCx/TvjKtyWzx47F7DclNdDf3wSvKx7iB5nwgStX9tgP7p+s7RQ3wCHgFrzn69AdE
         RhGQ==
X-Forwarded-Encrypted: i=1; AKwUvBx40FjDJChyooy76GoQF4+CiO9tiuz/DWv/i7FpYJXDXafHBaxJF8T75OBazEidfkkb9L93pIm/GhLG5i/ikTvv@lists.infradead.org
X-Gm-Message-State: AFq9FYIUCN9wZa4ws77jSzi1oDcO0Fke6y0xSa8f+X/hHY/HFQE10haL
	zTDV5GzkGIqjGqdXukeC03BLRyGdbP0EcFv6yA5d3G7GtejyHlIen3cD
X-Gm-Gg: AYBFou2wcIrOASThj+1qsiseGt030runJSSvsFP4v9nE0DG8fRy+JHlg+nEDbX2bt9L
	fq/D5zkYnj9NGUS/U0HP6iwUsL2mBdDNxBUOzcSHqAAVgyv+xCFiOmUlS88W4f3GaRPcdBkb6Ww
	B0TCVIoEQ/SfRhoMX8zOw9uLKJ2f/gwXId3ShG672x5jeCvMU5y5Z0vU8afwR4HgEsQPVIRvBzo
	+kALq0/BJe+KOxDodSvpt5RK/RiwqP1aenlkCMeAQa7CdFZcd+D9J+EWrVSz4GZljIY/ATg5EmA
	IFQTr+u1RunnTPIzs7KCVZlFlxnF9XLvP4G/ZiHTNHKe31VhFMhZowg1XMvByHZwAxln5zzSuPz
	tNCnLiiQ6+Hm9JfulN+TshnmYi1gXggjdykcdgh+2wgtdEXJV8mkEHycr01K9Q88wPoyR4NKNmN
	K6MsXEkGs2iDWU8Uxktzt6cQwxkAeklgvjyCfRUBZ7mydnCjPiIUuZRCcN6j9sbh2dQ9sj9SsAq
	Y5ii/TEMNkymvVxVuNb6XtkXV41cVFxJcP1BsNmk8WmNYAZSEDs5m4PfkNclCpmXVYXWvoQPTGV
	0o0dwpWbtYExJV9B2uvFvpENVCKSXp/nXA==
X-Received: by 2002:a17:902:cf10:b0:2e9:65bd:62c7 with SMTP id d9443c01a7336-2eaffb17f6emr16531855ad.0.1793152267434;
        Tue, 27 Oct 2026 18:51:07 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c33917sm16066835ad.48.2026.10.27.18.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:51:06 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: quentin.schulz@cherry.de
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	hrushirajg23@gmail.com,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	macromorgan@hotmail.com,
	michael.opdenacker@rootcommit.com,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Wed, 28 Oct 2026 09:50:58 +0800
Message-ID: <20261028015058.11163-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <2a1c33c9-8971-4054-a463-60f3ceddd627@cherry.de>
References: <2a1c33c9-8971-4054-a463-60f3ceddd627@cherry.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_185108_415591_17E4B07F 
X-CRM114-Status: GOOD (  12.63  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Quentin,

On Tue, 27 Oct 2026 17:03:02 +0100, Quentin Schulz wrote:
> From U-Boot's perspective, I would have preferred there be a simple 
>difference we can detect at runtime and based on that decide which 
>device tree to load between coolpi-4b and armsom-sige7s.

Maybe we can ask ArmSom to write some OEM strings into the OTP of SoC.
So we can use one defconfig for two boards. I will check this method
with ArmSoM and current OTP support in u-boot.

>I don't know Heiko's or Krzysztof's opinion here, but I think it would 
>better reflect the actual context to NOT use a dtsi and simply have 
>arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts include 
>arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts and update the model 
>and compatible properties.

Thanks for the suggestion. I checked the existing mainline DTS files and
found similar examples, such as stm32mp157c-ev1.dts including
stm32mp157c-ed1.dts directly, and the ARM Juno SCMI variants including
their base board DTS files.

I agree that directly including rk3588s-coolpi-4b.dts would better reflect
the relationship between the two boards and avoid unnecessary changes to
the existing CoolPi DTS.

I'll use this approach in v2 unless Heiko prefers otherwise.

Best regards,
Jianfeng

