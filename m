Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92477D29C30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/GHq/FwupelaKODLYbp4EN6rGymDtQOU5bIeaMRLa0=; b=TqXMqeY9NvtMFR1fbcuUBW675y
	HO22bEPuCM5eM4EBb6LHHO3TdkJjo8Tbh4vDchyK9im/b4jM3gC68BcLoiJ5ShGl+lNQGGqx35Vr2
	b1QQWiLKvUs9otF/ysJTkfz/i6lfIj1K3iNZVIQxKgwNyG0QMiL4EeeJf6Z2yXgaHtrwbVG62eSEm
	oweiv2myOMhxdn2YlL1TzbjoE/46YA/vC0zwARQKnFh4VlKO/VXZJ3fA/m5vFFgmDCewr7u6OYuk7
	2Er3IudMpHveqWlwdg9+3CrAfIQGjPGvz8O17CY/uKbv1myITHwsXXrETJe8oZgQ4inuQeura0crH
	pxQfJfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqIE-00000002GUO-0XAn;
	Mon, 19 Jan 2026 14:31:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqI3-00000002GSc-3atm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 14:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=b/GHq/FwupelaKODLYbp4EN6rGymDtQOU5bIeaMRLa0=; b=N5vJmVnYMm55T0hftRRW+1HlHW
	URL0IVIknWUGNlbCg9hXWC5wWNj8nFhdt8+3EiWKyPqlgKVnlul+EH0hpMHKuPx4mC6MZKIsf2DEe
	h+WJqPkgrK9sefZOv/ENVFPtR/3M7D2m3ndCtnJMuwJE6pRU6hkGdCHr8aJJ2sM97neBam4dxKLoZ
	qx1RS/2/Ah9np7Lw/YODPBtPudb/EhougfBnd3rqQpU27+uY1X0G2oypIXTlm2VrQvMEnvvE7+QlV
	U2Z2rB0mh+Yh/YYbCVm2WBgG8xy8hh5Y8yWWFMhNWO3YdmLPW6yyp+mm2i9mYTOL+fn9+DcizfJcG
	qKNt5LCw==;
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqHz-0000000CH8i-22cD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 14:31:34 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59b72a1e2f0so4870387e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 06:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768833089; x=1769437889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/GHq/FwupelaKODLYbp4EN6rGymDtQOU5bIeaMRLa0=;
        b=NUwLlCNMSb3Nuh6x9eZvh1kxtS4KE6J8uBSCe8pQK4ontK8jGkc5MVeaDqOc1n0UFn
         YeR7on+jO/tFs9L7uzDBfzZXQrgg2E1dJXsia6IpzAXTvgXHZL3Ys1/z1PttC/XgVqfa
         nwGkQXX7O8jGwGqNXgENZfIFUyufgSHEqPBo30HdrWS1TdiPyC2nEZ7Kyl8E2IyYpJ4y
         Ns4Hc/Gw7jnng6nKDH64HbZsVeiTFOGc/CDSCqRspD2yZuC2CiZh86NxZ/ez0qAPI1Qf
         a+ji5IsjYzsVEqJ5y0/GqyVs6SNJxy4lex59BGqELun5Y+t30G+bXch90YZrhdoqb8QM
         O19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768833089; x=1769437889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b/GHq/FwupelaKODLYbp4EN6rGymDtQOU5bIeaMRLa0=;
        b=MD3+ILwkl2yLq3y8ZuDqfRChg6g1QrYvqny+1hvzzKBoYWIjKLiew+GtP2sbtniVHh
         ke+1ESmB3/c2jxKq/UN+grHMJFsTZmM0LSKUcgCnIGus90miTK0aKvaQoDH5+MrIfLJ7
         6P6uXZSTR2wZPaLJdtOCiGHPaUegyLErhtdPbs4Cb7h705RQfhFXiGwE65JtxqI12xpI
         gmrVYKqpS4o4wXF0XvtC1C+JvjK82ysVoh8wfgJtAYlOGe4DqeVcc2fRdI0ZtKlPpI7y
         M+LkVH/03JJWppTGwH4zakrrF0VSvkkKFpwAPbBFxh8MBE4i/ux4HvijHGWIaXBNEqML
         48OA==
X-Forwarded-Encrypted: i=1; AJvYcCXmjoA81y2ypJVffFtXxpP7Qdx2Ptwwj48R7PvSBMQkJF6rMYfsTuuvRRBbvwlzEYhHpDBrhfBrk4GMFwrlRstw@lists.infradead.org
X-Gm-Message-State: AOJu0YxsIOXh1hKWZ2RvMzY3GidvdTMmK3T9mNHF61h5tmO90PkiWmMe
	YTpb9CJ+A2Civ+MyVSv2xpokGxgL8BpnVcnHmSpn83LqdyHA5YotiUPEeYHihqSuBp+2yhbEDiP
	IuUoQ
X-Gm-Gg: AY/fxX6Fw88XDyZD7zytWCk+t+1wIrlzvdVrQzuTBBIuNS3aTF1FCts9FIBlC0RFd4e
	FhHFXHp3+PxF4hCpluShFH2nF8QcEAy/5fzyczVXsDc0K/GhHQasFUcOu+2OXlS+O1OtP9j27Bw
	h7QPO8HCPKcbPparWGj86p+YcSNX6DsbDRvktOrdZQpMCqFL+I8DNdBoMmo96wCAvD4mxEEi5Gn
	2TrDE4YfXlrSdZWstQqiCMHFhPhR2vt0FZYgwBSBbuo90hon8ikqSunIvrCtn5bOZ+mS6vq0pW2
	7k9xpb4qVIy9Mnpk6EKBCiOFxwNuHaChIclsMEcElZ6plYrIi8tsN71AjwT9TLSMEiFYq4jDh+w
	L4uYVT69jjzhtMxvrfjO4fwhDYdlv8tPPG1D64dyjc2hqYLVqU5V+XnHFZ444vEPaF7/EKocKQ8
	LjA6G0hHqwtIT5c5RopzB2W8XVaBgsVrdX+C6PyK2y+ZhE2kbPzEPpMaRk29yP
X-Received: by 2002:a05:6512:33cc:b0:59b:7a1e:d3e with SMTP id 2adb3069b0e04-59baeef85d1mr4063767e87.43.1768833089322;
        Mon, 19 Jan 2026 06:31:29 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33e7fcsm3407211e87.20.2026.01.19.06.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 06:31:28 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Dhruva Gole <d-gole@ti.com>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] pmdomain: core: Show latency/residency for domain idle states in debugfs
Date: Mon, 19 Jan 2026 15:31:14 +0100
Message-ID: <20260119143121.161583-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119143121.161583-1-ulf.hansson@linaro.org>
References: <20260119143121.161583-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_143131_555614_AE7FC6C5 
X-CRM114-Status: GOOD (  12.48  )
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

Similar to how cpuidle provides the values for latency and residency for
CPU's idle states through sysfs, let's make the corresponding data for PM
domain's idle states available for user space, via genpd's debugfs support.

Suggested-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 919dff2081d6..bf512ff0857d 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3809,15 +3809,24 @@ static int idle_states_desc_show(struct seq_file *s, void *data)
 	if (ret)
 		return -ERESTARTSYS;
 
-	seq_puts(s, "State  Name\n");
+	seq_puts(s, "State  Latency(us)  Residency(us)  Name\n");
 
 	for (i = 0; i < genpd->state_count; i++) {
 		struct genpd_power_state *state = &genpd->states[i];
+		u64 latency, residency;
 		char state_name[7];
 
+		latency = state->power_off_latency_ns +
+			state->power_on_latency_ns;
+		do_div(latency, NSEC_PER_USEC);
+
+		residency = state->residency_ns;
+		do_div(residency, NSEC_PER_USEC);
+
 		snprintf(state_name, ARRAY_SIZE(state_name), "S%-5d", i);
-		seq_printf(s, "%-6s %s\n",
-			   state_name, state->name ?: "N/A");
+		seq_printf(s, "%-6s %-12llu %-14llu %s\n",
+			   state_name, latency, residency,
+			   state->name ?: "N/A");
 	}
 
 	genpd_unlock(genpd);
-- 
2.43.0


