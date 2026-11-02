Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BB4606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zu/GCL3M;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Kwa3VSx1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3Md2bnpbIvy2X912Bc1LhqLaDZUJHkR+XqT7pG6E7/w=; b=Zu/GCL3MDl8eqK
	O4H2q+kzdLjgA7vMixxwDlD6ElH9v6eByKaIYuKfbSKWQP0Vd0mjCdzbwxJFyQCWooJe4vzZmy/yE
	3TEzdjsKOwVBWRSrApVIkmimZIEESITE4+EnN+KNwuaE1ANkuQ10XgcsmrC44a6WxRNKh+7a7kpbQ
	VKSxwNz3UDW4zgXIIH7EJM7i3UZ/uGpoeC2IJC85zPvJOgNrQe+NZvIKEPFalW0eymOWyvuF359ZF
	d83h/63q9uBtBxRK1QauyKUJH/oSy0CNK3mQjJSlQ7DKwlAHH7jOYqyLAgieBWffCGvalAS83jw6I
	5hrWgQIinJ9eY1hYJ8Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsHA-0000000Ge5j-3OZ7;
	Mon, 02 Nov 2026 13:40:40 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsH7-0000000Ge47-2T3r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:40:39 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48e10a70540so1684126f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 05:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626835; x=1794231635; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Md2bnpbIvy2X912Bc1LhqLaDZUJHkR+XqT7pG6E7/w=;
        b=Kwa3VSx11z2wWbYUGG8A74AmO9zjzsruEnyuji8s00pYFbhhlIWeK6a74X4djDkunZ
         a1us+XlGF+f+jupqdN0oM9Rzmne2Hr2+qcj8f/QQ3ZaGPDYNzrn+4N49j4DRoezidmi6
         t6c2sKWqYgpPLBdV4KxJn/fMRlGxJUk6fF6nYlGXEB3Otnr4y0i/kfEKKMLX4zkAL93+
         KLM2p/jtELfDdoCx0YhSMpURhTRexh4fhZejCsV9MhOeeWkoiK98nr35FvlzIBoPXVw1
         QZgLYog/zFmi3LHz+X3IX4Dh/udl2cxAs4VifcrthJfPQ1I7ZxM46ZIVD0AEc3Zy5pKg
         6trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626835; x=1794231635;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Md2bnpbIvy2X912Bc1LhqLaDZUJHkR+XqT7pG6E7/w=;
        b=jn/G6POsxZLrRfCF3DbKIOiwo8SYStk+BAUryhR1Wgh942juwJhjpBvOUo4ykD/cdq
         S7n5QtyhTLc4HB9D+y7XaWPH+5qbT/9nic3z3QT2F39KignVxOUJpxD/TcKm16amUj8b
         OB7lbnlpGeAOjmtyRxNMUsjue2U4Ke2SqB03NcOE8c86c0cABOOtLZAmk14iizMQfQr1
         RC1RvEg8swxrEty3QRe3SZX83R3EqbeDD1GlMDADSbP5aodbUj8xUePyDSi9S+SKWMh5
         gK7C6KA46oOjmakbBMPl0moajyFu5B+pIRVxlUcXe2SFsJC++ndfOVPLcsLVPT3SYVSc
         V2wQ==
X-Forwarded-Encrypted: i=1; AKwUvBwe9fwoksDk5Fg4WXZ4wPqgIPhncMPBlVPw+n/3EvGyNX3q59tHZofHNz88JhzkylrwMXExEggPCqW/iPkPRS7B@lists.infradead.org
X-Gm-Message-State: AFq9FYIAb5OoZHntkowaiOOnf3Ut/CMrSCL/84eD07UtVg0s8TDWCJK7
	f5QBPg/AKkAIXmySWeZdHkTjK2aEtkVZlga7tTcSaWPkfO/ot9Z5AzY0VeZ1Vv+TVBo=
X-Gm-Gg: AYBFou2F69lYXucj6ZEGVZ2lTy29UBh4qNEaCLLIYLXqGYQRQ2+deA+4mdg39b8CHvP
	oJ/MTK2/jq1FLnKA/8D6oU/0OIV5z+USrhZS9VKkGF7LYfl4X3PnXZf7gtTt/Ah2XDtPI0YuucQ
	XSWHGX/N2Y5g+Wf0TcyWpFmGPoVR6ght9J7RjLle2PidagkaMZrSD1eS8r3zTklmAun4yEVZefh
	GBLVunEcKdIhiuHgwNDaJN+BMZeEzwIDa4sdgg55NOoScM5ZbarA7azq4E5tahc9v2t0MYQCJeV
	Ku6mjse2v5LGb2hNIRemAXanQSaZdPVypXRwYus5Jv+nphlzx4aZ5OiQ+85NY0FculEjaDgEyIQ
	0SnmBcouRnFZLyKpXrngDU/k2++j+yxbAl+oZ6AmPSsaxpIFSQtQfmq0S2ouFkZM9YJ2Y0N8+Fu
	fvgvm9NDj//wZc/N8/G2k5A9ejSDmhPU6DTjVoh11DLmMS8AJzdEpuMq/V2G6C3UCKfsAamylK3
	FmvDR78kUiU4KrcKPhsMn5b2dmfeMEIkRpyIYhSlg7qZrXkiWA5/F+2cud/ZzCZOQdlo7W6I+S1
	RJ4xCFz9oXgykUvQ8YMy0z9Pml3kXcMPsCU/Wqg1rOk8ZDMrGQ==
X-Received: by 2002:a05:600c:a4c:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4ac1765d7d7mr233451845e9.20.1793626835401;
        Mon, 02 Nov 2026 05:40:35 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 David Lechner <dlechner@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
Subject: Re: (subset) [PATCH 0/4] drm/panel: himax-hx8279: add VDDP supply
 for Startek KD070FHFID078
Message-Id: <179362683429.3310106.6925209959908507351.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_054037_655839_0E720DFA 
X-CRM114-Status: GOOD (  10.12  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Tue, 06 Oct 2026 15:25:00 -0500, David Lechner wrote:
> The Startek KD070FHFID078 panel has a VDDP power input, which feeds its
> DC-DC converter in addition to VDD and IOVCC. On the MediaTek Genio 520
> and 720 EVKs, VDDP is switched by its own regulator, and on the Genio
> 1200 EVK it comes from its own PMIC LDO, so it needs to be described and
> enabled. The existing Genio 1200 EVK device tree also turned out to
> describe the panel supplies incorrectly, so this series fixes that too.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: panel: himax,hx8279: add vddp-supply
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6ebc6210efd3502c8ce2b1b2740ad61f69188df7
[2/4] drm/panel: himax-hx8279: add the VDDP supply
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dabbf2758be8f05c3757bb4727f2e48fba4ca66f

-- 
Neil


