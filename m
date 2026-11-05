Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CE4606EE89
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 21:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FejWbY6x;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DWWVxvis
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VS8ybXF4DCq5tAk5+ls9haIcLFew0SWRjbxVZMJULQI=; b=FejWbY6xXxYM9K
	o8gDFuA1fds4hAkZQ0idLUEmaIIjGQWCHwddG00z2+XAZM1mt5chgo7nQXvHW/PgQCD6mK9gKEj25
	K/+MeXAzcGMz26DZU0SA0nzzmSItt6EfvF9POzycDXs8zjChBOqCbgE+Mjd8DKofmm60W5TJ+lFqR
	QF0o65vmSk45Mu2nliVHHpUr4WVgtZ9iISIyRubRyEdGFhiGnMzc1/TOnXt7d5Fxqq7Ov1jPnyG1T
	mMqnQzyTvNh17mRizJ/hEC2Exoc2gaS5YVbs0vqYL1k1WSsjAH72UN4fnHQsrGVu1c+LoDLzfVzbL
	0b1HTDhNeL2GrxI4ocmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gT-0000000AgH0-2MLY;
	Thu, 05 Nov 2026 21:07:45 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gN-0000000AgC3-3mKS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 21:07:41 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6b579003f29so1919144a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 13:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912858; x=1794517658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VS8ybXF4DCq5tAk5+ls9haIcLFew0SWRjbxVZMJULQI=;
        b=DWWVxvisHJB75ieyhbdqhIngUeb4toDq61pzzezLMWbemzJHEtQ/yWMow5IWk+GUAu
         fzgBve6rPo3iFJSRA6HZFg0KRilN3wWdRGEgyHF45W3lLHmRJH2MhZsR+x4IoK/NpCuL
         x5prJCxdfBH2gpUOv75M52KGoxXLLJza4Gdcr2Gr0z4MbkhsYW7rMuL1wZ2f14vguSa/
         ro0SqC1ICWwRKO5YIRyAZWm7pqD0P6dJnvAxPil1mKc4eSUB4Veu50skq6+NQRFL5oI1
         oD+Lzwo5KvmXmopLU9427bB6UALwNOUhYDUtQq85xarA0aDF0aY0GBVMIWakRn9hmVWS
         6tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912858; x=1794517658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VS8ybXF4DCq5tAk5+ls9haIcLFew0SWRjbxVZMJULQI=;
        b=XdmUKQ8ZRFRaU3QvsIHN4VuqlW73NGzigu0uIPa7G7r+jx7mHZUI7PGC1avq4k+0fk
         1zvEL+x4tk2bOm9wQbWEHn2v2p7LNIpyM8EFPQ5isZxoLE/nQB8qVdpVAHti4O2O37SZ
         BLilhPYoj0GQ9bw7weADz9PBNQ5XqecuV1cD2N5pTPPTBAZ9JHG4jExgH8kqjij+RZ0d
         hyUzd2BTFk60kPRST9z4ZGYcad0fB/t/1pahry6XtVi9enVLbiJ9tjd2H3ev9+tL4tqn
         Q0jSzbyvTqtTeVQS3rG7hzCAm/ln6dEZW98fyiCvjjLbW8XAetD5JEFj1Lgw4su8nalW
         IuNQ==
X-Gm-Message-State: APuU4Z84voDjWmsiAY15dsR2f83aZhu77d3yMoNSAi1m5mayhG21/Fpw
	uHUP6y9tknMdg+v03/DK0ToiQJdlLIMzQ0gnlZeW97jTHV33k3yhgFNN
X-Gm-Gg: AYBFou000aksC6Es93cfA/w3GAdLcxF7pO+q2Ms3y/wYJSZXtCdQ+GZSOXjiRsvhgak
	UMaomdSgNfVMw71vbE/+x/HCcT5XkatW5+bG+6WMGfUA17I9figUteWqrMQjgQ2a0bX5SAf3St2
	HRqm+zxhSQnodyrP8i2ASm8zbMkbTgZtkVoHspHiTKCd8in85YVcmVL1T4u6i+VvcrkVZ0AvvSR
	QTFWZAVhbeZaY01T60kLPi6TtD8AmCns8PXUPvp4LbltZkgpV4CCy3lTZVWcgOcRgq0lM5LD7oz
	z0nq99crtYSY6afUUM03i4+xH6HIU6UmGkmfAL49mMsP9cpNBsP6t5f39I8KdDmFFJ5TqXiwLyo
	s8XdZR+MUTwpu8luAbfv4LDQrqlKNP51Y5cQXwNhLHfCvgiY1fWswHZFBYzSQOIRNgRCgSnaYsu
	2YR0ccNANp4b1Ke+SYIIFO8eJ52yCweTbjlnrJqMS0q7BBx/rvqsz39Cb4bvq9UXgOlKLHnyZA+
	ge5VJf/pyeGsM1lf1Q48t7/CBSj+4rYez4VTztGsPfBhTti85hpjL/6UZQgRcPgmnr+ECLjTrbb
	A+JqZfcfL2Fv0xBpZYUmv/lYb6weBQr2d12Hf7BrVjeCXBrQvA==
X-Received: by 2002:a05:6402:13d2:b0:6b5:63b7:5738 with SMTP id 4fb4d7f45d1cf-6b5977ddcf6mr294137a12.10.1793912857834;
        Thu, 05 Nov 2026 13:07:37 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:37 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: serial: mediatek,uart: Add compatible for MT6895
Date: Fri,  6 Nov 2026 00:06:00 +0300
Message-ID: <20261105210622.523747-3-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_130739_951921_CB109D2C 
X-CRM114-Status: GOOD (  10.87  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a compatible string for the UART of the MediaTek MT6895 (Dimensity
8100) SoC. It works with the existing driver through the
mediatek,mt6577-uart fallback.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..a3969cfdea7e 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -35,6 +35,7 @@ properties:
               - mediatek,mt6795-uart
               - mediatek,mt6797-uart
               - mediatek,mt6893-uart
+              - mediatek,mt6895-uart
               - mediatek,mt7622-uart
               - mediatek,mt7623-uart
               - mediatek,mt7629-uart
-- 
2.56.0


