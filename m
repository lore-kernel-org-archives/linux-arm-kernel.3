Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF64606A322
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EOOCDF1D;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XqElbCRC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F6iyjptvh4HoJM36iNO76ddk9CmJXz5lBV2KpfdHPWQ=; b=EOOCDF1D/9XRa2
	31tppZ0TucawI+n9hApPMG54wFqhG7W18nvgecrYcmG29/GvGyfgYEKWAccXO10Qx+DcKt29GsQQb
	HwATk7T9GwBINhaodPw+hz1+NUO78oqil4OR+j7tzDEhAzdmdvzSh8gn84Bh8hi2nCWgHvAcx43Su
	DBffW7kf5ZzbQW7p+uOqi53vWhlzGoGJOPAbG0YwU51W7Pc6TgKWdzbc31QEzrG8CLW5+7evIdeVj
	35sPpz+Ful1ynVQBiTqVNoyTXbdFBOFDPzw9FIL5SSD8B6tDywUAsOqyBZpMfXcWnSsYZJRUsKRni
	zZOpVCSvu5oxHfB8IbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZc-00000009SKB-31mu;
	Thu, 29 Oct 2026 13:53:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZI-00000009S0Z-45a7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:53:26 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so20674405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282002; x=1793886802; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F6iyjptvh4HoJM36iNO76ddk9CmJXz5lBV2KpfdHPWQ=;
        b=XqElbCRCcRteYdPTh8NlFet68NyRXRDUsJu6WNnjVW6PZjSbNKHtgOXVFPBfWWP2Lv
         d83ZDspcYT4GygDCnb2aYxqdIHElTDIpYvzdmx8wFWsTmV8xUg9t/ZnIcEWIE8JGRfgq
         HiOO+HVIJN/iL4kT1/5kD8ladV6RSHvA5yeCOg6ZlL365GqUArEdRt/ryHxTMn872mcM
         t4au58lCIjDiwYMwcMW8QJd7SMHp0EeC1eAudUlmIMi3HFdrDzpCq/NjywdhLrDnJbtR
         0j1eUZZz59yUXmdXnY/jmbRbzvowGVWWJm6zbvQuzki4LGVfih9RuY0u3K1DvypZSBvl
         2hPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282002; x=1793886802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6iyjptvh4HoJM36iNO76ddk9CmJXz5lBV2KpfdHPWQ=;
        b=C7kro1W3sD3m5j2fV2qF3JJAr6H7n2q+RoZjFjZcnE4EppYX13us0Szj0qOECATBHj
         +MkKlsRyY4PNVH6L7ArzmEEl5YId4zpjPqKw4UQZgva5lzISee66ilU2RtCy2NKqFZyV
         ChWBsSd7TCm9koJvG/O1bEJUt6PbtczBYBBgZodUN+Y5elqAQm03DAA8H9bxUjmGisLX
         J5ogFMW8tQIGl3348Sf09YEg/+hKeNefynDhn0AnZCQMlzgUElVExIKJFB4ZgG49tzu9
         wwLOrNaoDf19JeyQ/xoOrjteYM6vO7JBMcsN9hIvFVw78AWHBYzLrpxlrX/XDrUpZmip
         aOHA==
X-Forwarded-Encrypted: i=1; AKwUvBzO3ASPAnzN40UBIDGfd27JBxxWJcgOzkjC19ObPEqM3N0qlAWMrsQq/rneLwBKu2Rh34vDHS17V9gvGOMRvuS9@lists.infradead.org
X-Gm-Message-State: AFq9FYIUO2pLw/kScYSCSTCjcNm22nkerVmQ1mcmkMpngS/ILvN6PcSU
	mU8d4Kj94safodOj3m5ityx5CSr/yXXVMlqyPfZ4LyKGXFKYU9iBHJc=
X-Gm-Gg: AYBFou2z162N3Ddkvp7R8j/DhTukf9S8eQIf3OCepdxtRGSWDl9YQ9JDD26CI+BNTrI
	L2JdR13Z1/SNz1oQMCVnb4yNnVCnjXHg9mtEE50ohSA0N7JKLgGW3bzJNVgvoVqRIbzdbSzBOJq
	YOfc0dxEfcsgMLjlpuBW56s4uneI6q6Qzb4o6+A8dq4czSIwsl+6+4fUVqhFrpqcEx/guZljn7d
	hFyxIXYUoW3HXsBNi13W70UQ6mMjrx+NvDmIsBgV8op5BQCni1pXCfOrm1rJeN4fJ+sHaVWGna/
	XFFY+35PcV8L9BPDDU34l3y9+ihovgWznBYn4SElZ9TQAlJRLd1KwwJSD+wZsF2ctElZ0hzWt0U
	qBpdAgJ7Y1Q9a2zJiv79MwEFPFbMfC5o9iGnpbA8e/ZRUOLAHulp1rY3YePR/xOWCLp8axnLILY
	38XFLdK5x+TcjoQZHNjbIs919n8LAAls1R3YEG673kjOEesnsuRWNWLY6CxO6TaPJ4VBTyNW9QY
	w1bJ3/C+lQ68iv3G+56l+fm3LixF3sKsUSGyZXNpnBTz5DGjrbpAxEBWI8iLIWfqNvjE4IDPAd/
	QGGK0d+tfj2VClUrrepEOAJF0zlnq1LLcfxEwn+mQ8Av+g==
X-Received: by 2002:a05:600c:19c8:b0:4a2:150f:160f with SMTP id 5b1f17b1804b1-4a967d96ed4mr130087105e9.25.1793282001580;
        Thu, 29 Oct 2026 06:53:21 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:19 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:45 +0100
Subject: [PATCH RFC v2 08/14] temp: add LPAC regs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-8-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=3442;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=RZEFtq/LXNa59m6pbHJ662cjcscb6GjQIUaPl2ZCGCY=;
 b=Gg0EOPcUOgQpNZut9lNNaoRdNIuSBEJgfuo2weKWP2BE2uB9+coUCffV36k/9B33kt5L/B+7s
 HpwtMjcdQ9CCbIIPIywq4tqFWNV27VuvFgGbiHV02csNFC4O1QaG7Tn
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065325_059511_287B8A43 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39416

should we merged and we should sync to mesa instead

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 3349c01646e1..bb49f6a61a9a 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -276,6 +276,11 @@ by a particular renderpass/blit.
 		<bitfield pos="1" name="ACCESS_FAULT_ON_VIOL_EN" type="boolean"/>
 		<bitfield pos="0" name="ACCESS_PROT_EN" type="boolean"/>
 	</bitset>
+	<reg32 offset="0x0B09" name="CP_LPAC_PROTECT_CNTL">
+		<bitfield pos="3" name="LAST_SPAN_INF_RANGE" type="boolean"/>
+		<bitfield pos="1" name="ACCESS_FAULT_ON_VIOL_EN" type="boolean"/>
+		<bitfield pos="0" name="ACCESS_PROT_EN" type="boolean"/>
+	</reg32>
 
 	<reg32 offset="0x084f" name="CP_PROTECT_CNTL" type="a6xx_cp_protect_cntl" variants="A6XX-A7XX"/>
 	<bitset name="a8xx_cp_protect_cntl" inline="yes">
@@ -333,6 +338,11 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0845" name="CP_CRASH_DUMP_STATUS" variants="A8XX-"/>
 	<reg32 offset="0x0908" name="CP_SQE_STAT_ADDR" variants="A6XX-A7XX"/>
 	<reg32 offset="0x0909" name="CP_SQE_STAT_DATA" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0b00" name="CP_LPAC_RB_BASE" variants="A7XX-"/>
+	<reg32 offset="0x0b02" name="CP_LPAC_RB_CNTL" variants="A7XX-"/>
+	<reg64 offset="0x0b04" name="CP_LPAC_RB_RPTR_ADDR" variants="A7XX-"/>
+	<reg32 offset="0x0b06" name="CP_LPAC_RB_RPTR" variants="A7XX-"/>
+	<reg32 offset="0x0b07" name="CP_LPAC_RB_WPTR" variants="A7XX-"/>
 	<reg32 offset="0x090a" name="CP_DRAW_STATE_ADDR" variants="A6XX-A7XX"/>
 	<reg32 offset="0x090b" name="CP_DRAW_STATE_DATA" variants="A6XX-A7XX"/>
 	<reg32 offset="0x090c" name="CP_ROQ_DBG_ADDR" variants="A6XX-A7XX"/>
@@ -521,6 +531,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0b29" name="CP_SQE_AC_STAT_ADDR" variants="A7XX"/>
 	<reg32 offset="0x0b2a" name="CP_SQE_AC_STAT_DATA" variants="A7XX"/>
 
+	<reg32 offset="0x0b30" name="CP_LPAC_CHICKEN_DBG" variants="A7XX-"/>
 	<reg32 offset="0x0b31" name="CP_LPAC_APRIV_CNTL" variants="A7XX"/>
 	<reg32 offset="0x0b34" name="CP_LPAC_PROG_FIFO_SIZE" variants="A7XX"/>
 	<reg32 offset="0x0b35" name="CP_LPAC_ROQ_DBG_DATA" variants="A7XX"/>
@@ -1207,6 +1218,7 @@ by a particular renderpass/blit.
 	<reg64 offset="0x0E08" name="UCHE_TRAP_BASE" variants="A8XX-"/>
 	<reg64 offset="0x0E0B" name="UCHE_GMEM_RANGE_MIN" variants="A6XX-A7XX"/>
 	<reg64 offset="0x0E0D" name="UCHE_GMEM_RANGE_MAX" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0E12" name="UCHE_DEBUG_CNTL_1" usage="cmd"/>
 	<reg32 offset="0x0e17" name="UCHE_CACHE_WAYS" variants="A6XX-A7XX" usage="init"/>
 	<reg32 offset="0x0e04" name="UCHE_CACHE_WAYS" variants="A8XX-"/>
 	<reg32 offset="0x0E18" name="UCHE_FILTER_CNTL"/>
@@ -4406,6 +4418,8 @@ by a particular renderpass/blit.
 
 	<array offset="0xaec0" name="SP_PERFCTR_HLSQ_SEL_2" stride="1" length="6" variants="A7XX-"/>
 
+	<reg32 offset="0xaf84" name="SP_LPAC_CHICKEN_BITS_2" variants="A7XX-" usage="cmd"/>
+
 	<!--
 	The downstream kernel calls the debug cluster of registers
 	"a6xx_sp_ps_tp_cluster" but this actually specifies the border

-- 
2.56.0


