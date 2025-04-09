Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F52C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GR6tf5HnTdYjHHauL4mMQJSHDwxOZy1mNmBZNfCuxOo=; b=CLwTQTplo/sb5SUd1FGCZkfkHX
	orCfTRQB5Z4VLWjGieYjdOdJuNV+QYiv+jkZACk9DrcQPgWaBMhpCNlF+qmBG1sXijnwyu8uSxaop
	cQ3Ubmcex+cKj47AVD8aRizZhY4JNBevm5IlSlIWEmj5/Bi+o56D4Q8UxTdQYibDQCGK06RzaaMJs
	GVm/hNwVeF9A5sW4BaR0W29GHIrACpIP4CdhPJqu3cHZzKuXGv26cjbwogZi3QmCI72fIMB9z14OK
	GnhyAQaPxlFeSQejJhT292RI458zPx4XWHDJ2Y14wr3gWnDLSrEEBlSRsXeqvGU4RxowHs3aCTzNE
	995bu/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2chY-00000008XSM-3W21;
	Wed, 09 Apr 2025 21:11:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB3-00000008SfQ-12DL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Apr 2025 20:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GR6tf5HnTdYjHHauL4mMQJSHDwxOZy1mNmBZNfCuxOo=; b=bJnnBMAcxi61xRQdzh2xw6br1e
	P7sUol2dESwmjDPjfQgdba84XXW2hYnTqCsuiq4UiK9vVF7beLGtl1vCd/DkOKts6Bqvi83qRP/OM
	sH62b7Cn+N9fp66RM84jSFf8miilFteqRNenjt/U0YZODGw783vGT5yziwoSU1YMdDy36cVjos7e/
	J+5zUOZMrdqBwfMDw+pidmp+D0iqLZcoEIP3wO68jfU7Z2EDhEgD26pTKsSGa2VZRwCSdTd+Txxtj
	Tkkk3wzpK4clIOnJnmAf4XepL0Ch7fsYeq2stQoCSH0ekJUaaOnZl9tj6MAUZHO1dJVgApaplrBUW
	MjxNabMA==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2cAz-00000008gYn-2LQv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:39 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-abf3d64849dso23620966b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231055; x=1744835855; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GR6tf5HnTdYjHHauL4mMQJSHDwxOZy1mNmBZNfCuxOo=;
        b=rsDa106B1BXT+eHc34hny2Mo/EWa3yuYYztN8YSUNDQprgcTMBJxNesFxa8tf4N73W
         N7fyXe8yIY49W/w0M9v6DP3P6miz6ALDJZXyQyeMNkxiUUmyHc62SHcM1ao+NRuuk2+6
         edw2avVyKvNd5WEYnX4rX2numHLECaxlahoSuLiSmMml23gr/VncTx8aaVRtlHNP0kzh
         vvX70uosstcgaMt4YH6Lt6LKxmUe5hUU8Pm2zHCbzhq3+YkQEEfDE3IarCp2Ne0gTqbY
         c6d4Spwh9hO6HTkGXvZ3pcliN1eOkAN8tf9+xw+2UnOjsacvBXGqPJWnobUagZMzfjcx
         9nAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231055; x=1744835855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GR6tf5HnTdYjHHauL4mMQJSHDwxOZy1mNmBZNfCuxOo=;
        b=YRm0QvqWSzn6+Rbv6v4QYCyNXv1mbenhgBJkKCqZfdKqRoH6dQ3TKUyMy65aLxfXUw
         5nres1jPKMfGw/APElJvI7o65hjQtOnefDugP16vNa434aV71fHY0UfwpwkpuTncBNHf
         PX5GRdVawQcQ86QJe0sCo/Wvm2V6A+Di0qUZnvi9FKLa8nz5q88jjNZEBA2IkUZT5u6J
         4cLAcfqD74UdfoYywovUQBXB90V6xVW3RFtLW2JlonooqB2tsKYyABuCaephPAkmRMdT
         u1M/b68GSU5t5D25hH+6mM7gfZ5UFWT/Tuq1xu1JVQEURZzfr7Ou4WffiOU7Uy6UKkXP
         JoAA==
X-Forwarded-Encrypted: i=1; AJvYcCUtzIOfo1N+bcIq8I0HBdLyHSdOBRlF5HfUsi5VFdbAcKsgaDWTN0LyYUI2Z8y8gIKI2WLnFSI/7LNXI6BMqX0o@lists.infradead.org
X-Gm-Message-State: AOJu0Yz86I3a65f+BfJXaR5jHX7mhKYfvoLZPUNQZY5/T803HfZjrWLZ
	nUvfWx6G+K84teSZUL7QtdIGykPsHaqEllkx2OWWnOTlMDnEOAiflAK5EAe46Cg=
X-Gm-Gg: ASbGncuE3/5ygckJGax2pH0SpgrIyawGWP8MZDMPZnP6vkulQfGDzReJV+31aBE8Yo6
	oMSavLIHjaXNkhX0aF1dGU5hnRro0btHMMgSQScjtrZh65xHJGXyyKF4hBhRkgdrp01w193N6aC
	ktnLFPM8tQByaIsj00ErvoVCxFquZxB2oR4dhV4JtnVrm1dadn3Jdm8lmdtdULz2Mrye+qqXlWF
	9f/osf3tP6CslqFNQmuRCc/eazyRCmXV8jJGMBsbI+I9v/7Eplt/y2rD1DtuzljCuAskMOl7MqI
	Xuf8XrMsZFQ0C4+fzPG+kdP9dAFXpC3bcnGJqwaEZXQ4RFfJEm0ltuzcGm0TQ0Hyo+zV4onpTDE
	Xo6FDlVFFDyOTlyjBcDPoKxTmhjw=
X-Google-Smtp-Source: AGHT+IEbXN3PVp3UzNwZ49hOGkb6oYJv8K6BHlu1sHCYFqZcbKKwZNoXvZRHV9zk9VQwcQRJgvnNLQ==
X-Received: by 2002:a17:907:d05:b0:ac3:f1de:a49a with SMTP id a640c23a62f3a-acabd4da153mr7965466b.52.1744231055177;
        Wed, 09 Apr 2025 13:37:35 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:34 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:32 +0100
Subject: [PATCH v4 11/32] mfd: sec-common: Fix multiple trivial whitespace
 issues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-11-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_213738_273768_917B5E3C 
X-CRM114-Status: GOOD (  10.78  )
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

Rectify a couple of alignment problems reported by Checkpatch.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v4:
- update commit message (Lee)

v2:
- make new alignment more readable (Krzysztof)
---
 drivers/mfd/sec-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 782dec1956a5fd7bf0dbb2159f9d222ad3fea942..1a6f14dda825adeaeee1a677459c7399c144d553 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -149,9 +149,9 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	pd->manual_poweroff = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-acokb-ground");
+						    "samsung,s2mps11-acokb-ground");
 	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-wrstbi-ground");
+						   "samsung,s2mps11-wrstbi-ground");
 	return pd;
 }
 
@@ -264,8 +264,8 @@ void sec_pmic_shutdown(struct device *dev)
 		 * ignore the rest.
 		 */
 		dev_warn(sec_pmic->dev,
-			"Unsupported device %lu for manual power off\n",
-			sec_pmic->device_type);
+			 "Unsupported device %lu for manual power off\n",
+			 sec_pmic->device_type);
 		return;
 	}
 

-- 
2.49.0.604.gff1f9ca942-goog


