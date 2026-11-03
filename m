Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B80D606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 19:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p2/pbBcZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3LeSidB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=px9zdgpwFS81LrmsDCxEPDim7SV/QUfj3I75ZxFvQQQ=; b=p2/pbBcZui1vSs
	1RdzXdphqYEOlMRQnx4Swct7/x1Ghmsjx3aIqA4yg7/qyz7tb4w8JRhwF8jzlKPvq9z8oqLjRFjeb
	UarkK4E+YegG5invln57uYhWIwhnOrIUnckkEVWh/E813q+QYvkJ7OjG76WAigxg7yNPSW7534xV1
	w0E8ur5P9tfC5HL4NmXeWHejfkIzfwxAdUs9rfztJ0FXATt1BY8NIWv8PKhbP3YDtlF7zatr6+6h0
	bWXbnIkEC6fvWd5ezEBqmmJPDEjo87sgGjx1hWzXkmFhCP9f5AktpDPpOMPImgOsZoU8HFKyMzZHa
	XBdIWujBY7Hw7fSURj5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOK6g-00000003WD9-3N8X;
	Tue, 03 Nov 2026 19:23:42 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOK6e-00000003WAn-0m9B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 19:23:41 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-844a8bf7e25so3153726a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 11:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793733819; x=1794338619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=px9zdgpwFS81LrmsDCxEPDim7SV/QUfj3I75ZxFvQQQ=;
        b=M3LeSidBsbU7m0lUwksNpYIGqs8GaYa22LuLRBGXD07T+w/zvI4ays0PzeJ6o/6Ltf
         mXzSWwkIAsfj/YA1RZCT2lXnOUhFEAtb2vhx/bmneIoDK5livx3TJf51xlt4J32UWrUY
         En6UD+B4DLaMXWygJHQG1+OWrlJLPNoC2wcIu+LLJeCqI6lLPZmKZ/6grmEjA6WsIp10
         DzUq5ctTkGy51DbKj30GtyuErixdey3LgL5J7BBx4MjjXu4cFNd001kjNbOWj0q9eJdF
         0MWUbgEnqVudJPHzGF/CeSNAtP+lDyjI45SCrFeB8LHoCtmZbpYpsdhOLnblzJg58Hd9
         h8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793733819; x=1794338619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=px9zdgpwFS81LrmsDCxEPDim7SV/QUfj3I75ZxFvQQQ=;
        b=Ms0WBcV8bsGBz8rWSPPdqUnt2xuyVu5vU9R+E+lPw00/KGNGD2TMNkB6uyQypEJEXp
         7p8N0eJknAjiNjhBydD3Oqb3HOW0JJGY1yB3Fwll0rHrVgF6GR0EgGtcx5dcYTuljmQu
         /cyiDxSm7iZIADGi3Txl01q21mfGVNC/eZKSnFpysY+WYL6Zn2se0QOXkIuk2jjuWat9
         cfSBeMOoHAnw1+igtE7X2eibVvpb0bA4J9eOF60cvkrA/0yGKW7B0gjQnmiV8lTLMQvJ
         6PsfzVP1StF3W7eShujoM74uiMBpwmDMhuZS9+JqZ7Zql0R9YLqqUheFp39H2s+riTVV
         OCwQ==
X-Gm-Message-State: APuU4Z8QDqWGOO3U71oqnCsWRPF5Hq4DBvWbH0dzlNsPdoGKfFFLHAsa
	UUTSD7AF6itRSVXsWSHFtdfDbUXGcFC4CTt7Ugr67IqYYQlHdd0pRH+/
X-Gm-Gg: AYBFou3JaR/DfecRubHn3s6FeQIAf5JVETRIMY3V7Shuh3LDT3EhODd374t81bndce+
	p6lKsx1bE3tlhcLT7HIoN8sNPHUFekeD9uvIAhuQ/ykD3qwJJ1Z8zN+Kj8hafHRm82belJxs0gL
	YBTQMT+qAY3z2tQ7XgDP4cJ7gTD7FaJF6m5MFgmH5XKxt2rrTCwjQ/U/j5yWdGrlj9tZVBFeKjT
	0aElhDqcAi9IOI3XjrWF5nEXTGq8oU9VGeG9n8/3ALIysl5JbGoTJXCoehDVGLexS3KWtZ2uVb5
	MJ3G9dmnYgn9LXt0brQ1a714Maege+u+QsLYgiTZ0UpR3qTy3LgcwgVM1lISagWscnfpaoL83ba
	cNhMtycpExvENs9EWUCjxultiVlixrOYCb+nZ1A4d8K7YmmGDgcjAMJy9j8FfpuGkI5EneEYZ+q
	02jyH+tlZqm3k2myDtoQUqMAtMJ1mQ6urnqEFfH9cPnDTvI63JGUyoGEl3lPxzSfieHKdbUcEgf
	KJmKwPvI11Jnea9O2+Y5Fp/83861W6f1EIzbrP6xupcQld0ESu2o1BdRy+idjY2GAaC0z9Zy2sz
	YMhPuS8mvt1y/O/zKYSCv/HkqpID6/GKs9mw1H44UM1PVnoIeqs=
X-Received: by 2002:a05:6830:43aa:b0:828:d647:332c with SMTP id 46e09a7af769-85d3647359dmr9188302a34.25.1793733819011;
        Tue, 03 Nov 2026 11:23:39 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e16ef1sm43323a34.14.2026.11.03.11.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:23:38 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david@ixit.cz,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	michael.riesch@collabora.com,
	diederik@cknow-tech.com,
	shawn.lin@rock-chips.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	tglx@kernel.org,
	daniel.lezcano@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/2] dt-bindings: timer: rockchip: Add rk3568 compatible
Date: Tue,  3 Nov 2026 13:23:30 -0600
Message-ID: <20261103192331.394489-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103192331.394489-1-macroalpha82@gmail.com>
References: <20261103192331.394489-1-macroalpha82@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_112340_215746_F683A063 
X-CRM114-Status: UNSURE (   9.69  )
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

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible string for Rockchip RK3568 timer.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
index 6d0eb0014eee..b245a3051d66 100644
--- a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
@@ -24,6 +24,7 @@ properties:
               - rockchip,rk3228-timer
               - rockchip,rk3229-timer
               - rockchip,rk3368-timer
+              - rockchip,rk3568-timer
               - rockchip,rk3576-timer
               - rockchip,rk3588-timer
               - rockchip,px30-timer
-- 
2.53.0


