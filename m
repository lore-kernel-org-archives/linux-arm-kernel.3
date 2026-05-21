Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97652CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJdvze/3qUGSdeaywOgRH9jPh9c2UmVUF7voWWqWYm0=; b=ttkrGakO8lVHTz1GQTz/M+rvl5
	RkKNibLqEU9q/XMjxIhgl1ssWOrxi28cJ0/0y9dAIYrzUpsjPdgPj6Z85d9Q9KkaC9MCRqJsEEISn
	smHhauo2rVe6PoZeuRjdCCqrqBd2QepPmEiX05DThl50F8XjdHlECdx1I2I/2b9NmzRmhHh1ftVNC
	R+XDTUXH+DHia9Bok1RVC4BhG0UW7sjtnualnAEUO+KuB+T+AZsI+5qupk3BOHa06sLlAna14lE2l
	Nd9qkwqUf5v6pzZ2HhdPfzXMzp+VNnllYQRPENuMKzgNDaYUtM9nFkeNPycjxk4dg7cqeAasrnYVL
	RWba+ZVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4ue-00000008EI1-0RpI;
	Thu, 21 May 2026 15:02:16 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4ty-00000008DhS-3UJj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:01:36 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45d96d21e82so3638528f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375693; x=1779980493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJdvze/3qUGSdeaywOgRH9jPh9c2UmVUF7voWWqWYm0=;
        b=NrSOeQjGk3XBLlXtdaAbiyd3Pg1u+/N3nfaPUOUmzaoM0lS8YCQlGJ4d5eWDlDCkNs
         w1O1lEdY0wVyPyCBKsJeT4Tu5Ke8fl8J4DvcyEA6LoGHQR+9n3TrCZCbZVVANCHis2kk
         RGd9qDYYSFtid5PbiX9N4+QZx+RvN/Xf3Ffkb5soAjyFB4/9vg+EYt1dSz8As8YAoyu9
         h0KRtlAj+0JsrnWHDeaQ+RGxn2wGB2LUbuurj5muDrLunKd8PErnNiWFtAhkTzf+zXjv
         VL7yHGq5CyXx0NM7qnyPKnhaba+6Hcmu9VLxawv7ko9LFwctCaQ0rEvhe/cTLAbZ2NUi
         zfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375693; x=1779980493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kJdvze/3qUGSdeaywOgRH9jPh9c2UmVUF7voWWqWYm0=;
        b=Xa5cnzCytEYEkN/r8qZU1AF/zzeOY4du+8UEbxxPUWyS31JOPj6pOpmb4vVxx1wmYw
         nf+KZvf3nBEAq93ewhXgcliGm2kPi0Dpv+mkLsqqTuereyWD3ID+npUJj1qg71LIDpEj
         aGrln+LcWheKAcW5WtXIJjimaMcj8S0RNdowM1nKG/TDtOdzFfQfya1CqsMhlBdb/jcI
         42m10c2144zlcMMUeR03SUjN15CvkUeFhVvCpMOVMbVfiWa3nmG27Yb9Bwm5lQJuU39I
         5yiwZvNazSmwyCAfl0CKBYvpFE2lXOqFTRHZZJaDH8NFALkNU+Cm6neQfAoxsCZWT5dJ
         73tQ==
X-Forwarded-Encrypted: i=1; AFNElJ9P6dOeTOc/zbjlEGvgZ0ReS5OY1L1yv5mtgKjl8Idj0FWO1CrHac0YyTKWDoECjeIzUTvbvBCycOokdCDawgCv@lists.infradead.org
X-Gm-Message-State: AOJu0YyaMBsxD1/GCKyvhOctZGNux4BISdFic50lHOvpRg0OInRQNgUM
	6C7QMlqaC49S08ZCWeebTMmaRcXwvq2YaW0zRmno5yDrpzJ5oIlFJu/9
X-Gm-Gg: Acq92OFoS8QLplqtNyjaGol9KtAum0OlqIuiqUV0GKl2150OAon/9uGCSnXrgrImtao
	CDw7BxKj0EEfkiozpAKPusJr6ZfYpM8CeXrwkNK/et+n/ceXusKX1yfwPvadeWdnchbxVJTakIq
	rcs4x9kh+KrXayco/BKS6mtJNdTEU2oYLX9c/zADWD3tLAyacsrhrEApLncG44AsyUia3gAq/Sn
	4jpXZpQDwghR4D9eVZTwB6W5Rq4WDf/2bO9tgiHU+9H6xk3RJvLJIVwnkQ5MXFF8lvEF7Q7QxFV
	zUBEM4gr+kYqX9UKh1sjURx4T7WJ9BKcUexMZ8Sowdn4qypC+rIItUUSCOpSSpJVlJLhq+yxjit
	ddycyIEU3LUNHi7YzNRQD1ygbmd9IxKnYO6XiIVmVQ2GHL5Hn0/8ZJV1tBwqYxi8pkVnnZEM+Wl
	o2odtso1doB+z943ZL+71TzZZSi6uvVLIC8/uc4BXFiQ==
X-Received: by 2002:a05:600c:17d2:b0:490:b07:5fd1 with SMTP id 5b1f17b1804b1-49036052603mr29364105e9.11.1779375689908;
        Thu, 21 May 2026 08:01:29 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:29 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 14/15] dt-bindings: display: panel-lvds: Add LG LP156WF1
Date: Thu, 21 May 2026 16:00:50 +0100
Message-ID: <20260521150038.103538-31-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_080134_918178_BD3851C4 
X-CRM114-Status: GOOD (  10.07  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Add the compatible string for the LG LP156WF1 15.6" FHD (1920x1080)
dual-channel TFT LCD LVDS panel.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 45183a1439ce..a6af2b9cc2f9 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -58,6 +58,8 @@ properties:
           - hydis,hv070wx2-1e0
           # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - jenson,bl-jt60050-01a
+          # LG LP156WF1 15.6" FHD (1920x1080) dual-channel TFT LCD LVDS panel
+          - lg,lp156wf1
           # Logic Technologies LT170410-2WHC 10.1" 1280x800 IPS TFT Cap Touch Mod.
           - logictechno,lt170410-2whc
           # Riverdi RVT101HVLNWC00 10.1" WXGA (1280x800) TFT LCD LVDS panel
-- 
2.54.0


