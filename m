Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7BCCE9D78
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipCBgG4tAC4eMeyn2MxISmiQcln27ZuBPIR3j6YmQYw=; b=simoBm/3uv8kFvvPKYWTpUCoOk
	YbW4V2mLlLw1Goc17huTFbn5FSHlpkjwvOsq0a+8uLJE48T1KM5R3wUP66dP7Cq90PkrChqKTGatN
	bBIPssysQ2YaBX3BtMIm1s/l8T9/MIuS63y5fxaQmAo5tFcrS+QUsUVqYbK3LR3F0k6zD7sCLI6e0
	bdy3FkGUOEqJ588ON4NwpfKHFFd8cGO618O8MF1WJ4E9Q5OAsxXKr7f6rORH9X1jhxNLlkTcWOG9K
	q9pCEyFhXZ2GwgUoAYXk9r2mj2ygDR8VOgOFpWrfRPL6FjIDvH2WWjfeSF5KX9eZryp7BwvumvmUT
	/mPmavuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9us-0000000DUGY-3KNb;
	Tue, 06 Jan 2026 16:28:18 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9uq-0000000DUEa-40Zy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:28:18 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7c95936e43cso470473a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 08:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767716895; x=1768321695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipCBgG4tAC4eMeyn2MxISmiQcln27ZuBPIR3j6YmQYw=;
        b=hJDs2pnh1IHTQ0BEz1dX6QJE3AaF2CmMFJsoQpdtLoJqhJu4Q+THaeWaLj47QMGQPi
         PGFTI0FxUK8jlg6zbMAxBLl2698sn7nmixhLwi64weg5giavvFAbcD4/kfrpJ1cb5QIb
         hrGJtFvMgTLa4fzPNP1oyLjJISUgA/IXLwhSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716895; x=1768321695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ipCBgG4tAC4eMeyn2MxISmiQcln27ZuBPIR3j6YmQYw=;
        b=GGi+0v8Na2poae/FAf4Iy8sg8K061z5drXiLaiFVpPV1e00DcWqxw6XJoyQOtPef9l
         ASXGUV/HN7bKwfjTVUfaoSnZiCTI+oBkmY0cAXpmWvLRg4UmeL+n9lVDvTEkoBWwRQ+m
         9nkdbhALEst8LiBU/D2zn3jlUBZsifBfgFpgF6MVr5uEOZIDXxb2fiNn9iO2x+GaJDyr
         cYQzTRfR7f46wVo9zcNBSn/swfHAswK5sKrALgOJreJoQDwHwBTuftN1xAl46346loRf
         /FJdVYjFRCroh4/pPnivAP04Cr+ZsewQuXslrAM8V5gzX7GqUen2/M41R7uesqGloLOG
         k3Ng==
X-Gm-Message-State: AOJu0YwpXhNqD969Hf8oX1xgso/EJsFEizgtbqRWueMHpTelheFLl8V0
	RDjqjD2qFkTEF7SHrEX7LVmBeePuN42dpiq8xd9j/aLUyfsIho4wHfcNYH3D+/1oSF7Ol6VpBAa
	OcwU=
X-Gm-Gg: AY/fxX649XHttlg2NAs+R73LZzXJcv2ouAVewv8/2n1xlWUjfzJNm2fSTvIqBDK4wge
	sKzizIETomx7CtZD6LFaJsTdk4CCj0xEdm0khJeB2QvsSaFzJKA6w5XGRwJ2e182E5urrXB5xHt
	3pkhDHXTlDFjPh7kznDh5oaQwMpX428sleu68OmvEtVtsm05rrerGdQWt2P1o2/DFvEgF+5UT6y
	edWl8k6ULrC3rNCkWo5tvB49HaJcwIOtAtt+C1p7tRZZ3Eqg7waWfIoEhKWPt2Pzba9MJm5U1pA
	VQFScLK6ZdiSeoW/oIdz4NZTMAg0g9uk1TzIVqRe64Wou/0Ldukousqb0baSp5Dq3AgSDkm7OlL
	00jufuBV28IlD3s6qCO05qQmwMpHL4Bv5+5LRIZ+EdIsKc7193mo38MvD6cAw1JQunHEjZCm5zr
	gs/cqmEvMkPsudIsI=
X-Google-Smtp-Source: AGHT+IG5unstQaaQcPjn0DiH3jaE5oSh1mV8bO1AA2CK0b4+WePZuy1yQ/9D0Wa0H4hxceCfnxGxBg==
X-Received: by 2002:a05:6830:439e:b0:7c7:68d8:f6f5 with SMTP id 46e09a7af769-7ce4663b84dmr2566399a34.3.1767716894875;
        Tue, 06 Jan 2026 08:28:14 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478af8b2sm1630951a34.15.2026.01.06.08.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:28:13 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Nicolas Schier <nsc@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 4/6] kbuild: Support a FIT_EXTRA_ARGS environment variable
Date: Tue,  6 Jan 2026 09:27:34 -0700
Message-ID: <20260106162738.2605574-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106162738.2605574-1-sjg@chromium.org>
References: <20260106162738.2605574-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_082816_999519_D67AE62E 
X-CRM114-Status: GOOD (  14.97  )
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

In some cases it is useful to be able to pass additional flags to the
make_fit.py script. For example, since ramdisks are typically large,
passing -E to use external data can be helpful.

Add a new FIT_EXTRA_ARGS variable for this.

Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---

Changes in v9:
- Rename the variable to FIT_EXTRA_ARGS

Changes in v7:
- Add a new patch with the MAKE_FIT_FLAGS change

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 28a1c08e3b22..e8da632d5348 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -400,7 +400,7 @@ FIT_COMPRESSION ?= gzip
 
 quiet_cmd_fit = FIT     $@
       cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
-		--name '$(UIMAGE_NAME)' \
+		--name '$(UIMAGE_NAME)' $(FIT_EXTRA_ARGS) \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
 		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
-- 
2.43.0


