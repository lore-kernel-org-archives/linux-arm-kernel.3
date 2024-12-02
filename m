Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3846D7833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZ+co9f4XoPsEknVzVXj3noJ8mlDHInL4O20KcNjoiM=; b=kdKtnv9CSAdJPweYHoPTzOjP6r
	D5uhpHQIatgLQDDjEdIx6XsSN3MZ9q7lwPei/miC+Iv46Bb/ZrGPuEMCj3KdW49j5jgUG57UO+2iw
	MKY7+V3V1do3igYR/wvl8sHAoF1hsnCA2VPKjKkiXvbeTs6fPe8bQgPu3kDoiKqzAv6OZYXNr3KMN
	lXgIevlmJhmTJoHyksokhiRll96tu65OWMYs1UTMF17Xo/k4VnClzhaAOR+n5oZRxsgGY8ybKX7mt
	O7gFeZiVClceoUSx/EYH/JdY8lEYYrhGqAo0Ok1wDHE24ve7MLJed03vd3iTqo/wCC1wzG+yz8U/w
	iISjjsmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAXq-000000074mF-2otr;
	Mon, 02 Dec 2024 17:49:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAKG-0000000723l-2d5W
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 17:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=AZ+co9f4XoPsEknVzVXj3noJ8mlDHInL4O20KcNjoiM=; b=pdTGzuxjPU3JQrP2RM0CdcNsTl
	8YiRNKpvs3MQKlmJ//yY5vK2OOpsl6O5eEf1VnQ38AIQNfZTxv96VkOIlsZx0mwRi4blToYittE7m
	XNy46LuQ5yBpzJsxSgsRCNyczLkXxTUgGLBMbocyDq+59+kS1obJomfpS5XCGKKLSQDGueS64Ywzg
	nluZswR8rkkveUbNn64b/FSE21e4D927SVaiU3tmPbRO0FIiiCP0oqBnbiy1UuV6+flbOTSElyBie
	On8AbhR+rRkjwWNGTEdDSupxN9nMycoQbxMd+ldC4r16wpw7cKhOu/UEgRauof+oTuzg83Ok5XFVE
	9p+z90ew==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAKC-00000002Dik-3zFZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:35:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0851A5C5EFC;
	Mon,  2 Dec 2024 17:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 637F2C4CEE3;
	Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160904;
	bh=FZmPlNwEP0dLH9uzEAPVjoA2IENASDBcbOxyxt6OpgQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Np6Vb9OHybQfNzDBImwNMJVhDJu/8UXyGodvRv29g6p6oSEeNdnBODBy7/6sK8Mt+
	 zlRyO0cedmOcRUNaIFPlX4cc9ErbeCj7+h5RT4pjxrGC77hKjrDMpHgNvCTqz/nTsN
	 w2i9wWcIiPMIwKxE9P4tpnswci6LoL102L0oXYpKajA8DGNgirvUJuwLmrOme0joUv
	 au2yD/+s5HolY3ATZHEuyWQNYlk57qFV5d0V2FGBKiMgUjnTAD8aFWym1eWRfJlkBL
	 pu0rc2snu+Ik9dYybACLnKehUFwBD96canGBtO+Btp8w/PUQyUWT4dLC5UwFytqCqY
	 7y0i7z89Sln0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D2FD7833D;
	Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
From: Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Tue, 03 Dec 2024 02:33:27 +0900
Subject: [PATCH 05/10] minmax: simplify __clamp_once() by using
 is_const_false()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-is_constexpr-refactor-v1-5-4e4cbaecc216@wanadoo.fr>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
In-Reply-To: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 David Laight <David.Laight@aculab.com>, 
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
Cc: linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=ktV9jrZU0giaHV9vBo3GiXQr/Qxl6VWxrueXUQe+OfY=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOm+74+eev1x37SU7/s4fOZsfexXwSuwUZXlqNClRp+XD
 71fb+e91lHKwiDGxSArpsiyrJyTW6Gj0Dvs0F9LmDmsTCBDGLg4BWAit84y/BX7aL9/YU3XnR7j
 ixp8Oy/Oeb/9EFPOXNM1rhuKog5yzH/PyPD2dPyivxyLOtx7gqSDZL8HtSqF7j576ccC5tVXdN5
 +EmADAA==
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_173509_413640_1A376A50 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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
Reply-To: mailhol.vincent@wanadoo.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

In __clamp_once(),

  __builtin_choose_expr(__is_constexpr((lo) > (hi)), (lo) <= (hi), true)

is equivalent to:

  !is_const_false((lo) <= (hi))

Apply is_const_false() to simplify __clamp_once().

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 include/linux/minmax.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index 98008dd92153db10c672155bca93201ffabee994..431bf76ac460a11a2e4af23acd90c0d26e99c862 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -111,8 +111,7 @@
 	__auto_type uval = (val);						\
 	__auto_type ulo = (lo);							\
 	__auto_type uhi = (hi);							\
-	static_assert(__builtin_choose_expr(__is_constexpr((lo) > (hi)), 	\
-			(lo) <= (hi), true),					\
+	static_assert(!is_const_false((lo) <= (hi)),				\
 		"clamp() low limit " #lo " greater than high limit " #hi);	\
 	BUILD_BUG_ON_MSG(!__types_ok3(val,lo,hi,uval,ulo,uhi),			\
 		"clamp("#val", "#lo", "#hi") signedness error");		\

-- 
2.45.2



