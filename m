Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73410606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E7hD0hgA;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=obXMkQwD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=; b=E7hD0hgA3lXmLJ
	6tJ4ZvN5WYHNe4OxrU2PYb2W4sGWnhrSS01gDeHDlXE1gLWNUIuYPlX4Z7vfFJ/9Bijx8YPuyd+dD
	kbMhRtH44yZmr7hAJFmiRQj2pc/UVEq47MEC4lGhLkyUQHbXrR+lQpIv2CT0E9zfEV99ePEhhW37A
	WyeYzOLuf4uJ4vdM8Ar0HsMSeitKmM12qImQA8O4JeYZWgRjHD+/OnDsH213algnXnDNbg6CXpIV9
	by4o4jrpd+n7wHOG/Tx3Ag6rJiM0bZjR6ahoH0bMGbc7gnTiqyvICJP+ICBMCwfmBGyaylvcyREnQ
	3KfKnyQvp4Zql3Q18ssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtNx-0000000EG9W-0zEq;
	Thu, 22 Oct 2026 14:03:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtNk-0000000EG2z-3Pa2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:03:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so22554525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792677778; x=1793282578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=obXMkQwD/IRhfNiN8/bN4sChBxKqkDcX1NOSSk+FvEuuogI2fVDmXsYBstnI2/YT8V
         rJUdSC/DeR45hwQ+wmuT25t/ESUUh4T6BF/yOdwltW/vcdfq0mCDnXg1bua964Vv+7K7
         vgjgLARRMjIiAbxJhxO3lFS+sKegSwooYKxkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677778; x=1793282578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=vHIQz87nphKLszSw0veHAcDmjAcXskSyfdE89112EOSMA72OV6KVhVKT6g5LP0mH2M
         mO20yDCtKlWOvUJmqw6pLgialLQi9cAEgD90NbOQuNyjjGMJnZ+2Rl2YGzKVqEvOfPjD
         z2fOpyQUINAvqwImpa7q8mOTE9BiaUdx2s1/oJX7CwR/WVe2F1niiznAdHFikKWbdGom
         e4GOGm3a/SgUFZGi/+FH57xW6gXplvdAcWQoQbQpALvFJDdoNsjDhzbMH+U/s4MNzBuU
         2DZIrrMGMICfddL8km/TwlIDnFIopVHou4hgxOdt354UCm7YiSQiEDCr/ZNCus0hg/5G
         V/yg==
X-Forwarded-Encrypted: i=1; AKwUvBxRwK82q4zmbdPygnBvhOFBQgP2mzvxyujIxQdUgC+dZ2SwkIIjdq3mFVt16APr0lpSvDGgvGqIMtSlDGHW6df2@lists.infradead.org
X-Gm-Message-State: AFq9FYJTCKu+XnrsBGBDHDD2sd+JBVWZvVG5cbesiCk8ASkYw0kfiKmf
	TYbgypF02ajzq1hI38nkByVbwt982NyHtyUqP4pJlOzxELIoFQ1Rv8TUEXNpsJVoYlM=
X-Gm-Gg: AYBFou3L3llCB1pVY/GsfuZnJqdbI+e70KXyWbc+dFu6zkubUpWaOVmCDhLb6ksMlVi
	CcKh8wBWNIHioD5CPlKYLZI14iaVhzhsPikZXbjM4VvomcMPDzj0xS679cktNJG6nzLLXdhEaRq
	tzoKxF+u/+dALfNM9ZL2HNkRHyvs3DHE1EaZkEQDtodhgQsHs1O8UF9lOw2N8OF/BBFccxlI+Fo
	ptLChjW3x//nf9ugz3gbfoL3OpPNvlmac+QGadhO/3Fa1k91d18YHx1QRbej+DsypSWLVBH9gBb
	pkazUqqlViLipLnDMunChu4vn/IBeb2lq08Z6YOutXjf+hq7OkHxfVYOARKIRIhUGkiRmf4Wt2G
	hgw51bQfNWOzQh97iPZjW44UHW/C8o1B4w7a+93q+s9wlb9uduEpPJOQma2B5qsFslbo1YHbRq5
	BAdx1YdGKqmZLWhcmDzLfNH0Nrb656yhZzyUunQErLkiRD0RUSy7tVstT3Xof9sNFCgjyUBlQ3Y
	kVRHxBMi0LuR7WlLyktPpfccnN+gdm3vViKXrvgt6fKCkcHZ3mcGZDQU1MqcLqB0hqn28T7
X-Received: by 2002:a05:600c:8b43:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4a200a9ef31mr92100115e9.8.1792677778171;
        Thu, 22 Oct 2026 07:02:58 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm12538258f8f.32.2026.10.22.07.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:02:57 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Thu, 22 Oct 2026 17:02:42 +0300
Message-ID: <20261022140244.3476844-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022140244.3476844-1-petko.manolov@konsulko.com>
References: <20261022140244.3476844-1-petko.manolov@konsulko.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_070300_880651_35DD0CB7 
X-CRM114-Status: GOOD (  10.18  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

The imx6 parts that are used in M48 are imx6q and imx6dl, hence the
two bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..8f3a04228780 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -260,6 +260,7 @@ properties:
               - boundary,imx6q-nitrogen6x
               - compulab,cm-fx6           # CompuLab CM-FX6
               - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
+              - draeger,imx6q-m48         # Draeger imx6q variant of M48
               - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
               - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
@@ -458,6 +459,7 @@ properties:
               - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
               - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
               - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
+              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
               - eckelmann,imx6dl-ci4x10
               - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
2.47.3


