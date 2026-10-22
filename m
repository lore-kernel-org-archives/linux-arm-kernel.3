Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3116C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 00:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xsNxuULT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lu4qgOmA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xX8Jeb7zcqlanRR5cQP8+zZOGl1Uky6hdK7k0PUYqPk=; b=xsNxuULTHuooVfRqH406jL6I+R
	OnMuU6k19b/wvPBT9L3a0TLTmjGStU/4Fn7y1uNeLgkokivkd4Z9ILJYkfgY2IDyKxNoy6Esu2pQ1
	T5TLkS+zEjx39CNfvmVPhEpZfogsJknkQtFoZNNm5gGJIRy1pdz2Sk03JxiY2AbJTmNKZbIH6i7dh
	n7PIVa6vBYKpwut/NmwAU2T9XGqbt3pKlFNle5uJc63qRntPezeNttt+lEKYadCK8NaAc5n6Ui1fb
	/4INxe6UFDbmAnU1Yeo/IuWvun+wzTQu88M0GxwH+NHgx1C0yCtfiMO5AQAdnq9P/WwFvTPnOoGOO
	XwLATg4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJgMj-0000000D59q-3Mvr;
	Thu, 22 Oct 2026 00:09:05 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJgMe-0000000D58L-40uU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 00:09:02 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6b19e291cc6so1035437eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 17:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792627740; x=1793232540; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xX8Jeb7zcqlanRR5cQP8+zZOGl1Uky6hdK7k0PUYqPk=;
        b=Lu4qgOmAgD7zB4+cPTAzICP+rzrmpJlzZxbhESMnOSMD7yhjE1LtmxqjjIA7N5MoAf
         uMTbBabna6rmbHWzU6t0GMOwwDA9D5GsHKpp+5gdPSlvQ9KQLV6BrcQWI2/rJduptH8p
         qeF+DLimABOQpICqSDVWJWoG/RLnBOHxcyXEbyZIgzlNGDD2IVatxxD+Ied0bKTzWvlP
         dQrnjr3Cu4yF7RYH6Wq5lJF8rseIyNU3hSJFYk6H0vJMlcDZOj8YZpGA8QoET2OErTd1
         Me/IAaOoYCDGHEx7aL1ADtiJlV3E8a/Bw2t1vOmMGIYJC47AThFYVMU3B/xSIuayWvq4
         Vhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627740; x=1793232540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xX8Jeb7zcqlanRR5cQP8+zZOGl1Uky6hdK7k0PUYqPk=;
        b=cVY8tMNAE+6Kgqn2aGB9Rm3ndnzehTa30TpY7EOH1GktEGx6noCOEUwxGH02vIfSDC
         onpvCNbtoxclod7wbcaAj/tYooSErk1nakTDHS+Hz437DzitJSj73Aq6ca4EZQDKv2YI
         TmDv/AmDGpYXuHjzPS782jyZuLKKw0KNe3W22ZNi+SYPfp78WM/77nuxx/sNagtb1oaq
         jViMVB+Cl6+LvrQ7bvaEoP2HEei+lvuRVyLEJSDovLIf3oMUMGnqypZckdps08E2q2p7
         0qxhdq4JUTtMJoxXoiCwQBACdTcx0kzVtcViZ5yxA6RHBNolHzjDi8GnBlIKgnW9ubbn
         x48w==
X-Forwarded-Encrypted: i=1; AKwUvBxw53nSk5FTnFdPmn8WJ7Ha/IS+ZJKNgqVSwAOWL1sYfgNBQFRMumzCjm4yuEMlar59ui2lBuOyiGh+Z3X874nX@lists.infradead.org
X-Gm-Message-State: AFq9FYLe1fjX2CFXAMqcPNaMhvCZW5kUnotvoOPpqdpiGL3ScTwZhmVS
	+RoKXhZVmuFo9MizPxi3+Qb9cZp+MSppRr5HK7PB3/8Q1wsTQSelXRU8
X-Gm-Gg: AYBFou1ar73hhXuQXKdmSA+JgBgHq48Mpqo0vi16UPv9DcmX9SpOA/Dt0ISzQxx0/yR
	gGp15yBjyC3fh4yEFJapwFgpPX9TXYJnXzO5catO8zKTn3ul+baCh4GSQFJI7JR9YHjm4MOOWqX
	NTbpCFfWOfexdzeAUtQihiUwjlGOodxe3jK2C8q3INfhoCurGLmINe5ik9xzBXHfJuP3hzPR+Mp
	IyZw6YAS+uoA9E+bWFLX+4PHUT/T/a03lHoutbV0AfZC41Ig8s+KJrlXgUbeXirjqybUL7fnTAJ
	vqfk36bqFLuBKLPzmygSjK66bYoVEeRu6cSUHDZoVl1DILDuXPteu/cp2VGTSCf6SGva7Fs+ROy
	b+shGa993JHVhpXrClmvbZBZX3dcP2hDa4+6GwpFPtYFBozHIZnm+h4EW/aw/vG3+UlbYoEQNdN
	UBk5vJt91KBPCp6ZV+/IsNqJeh5ro1FrjVSOZGkWHdNo2XyMEEXe+oTIkq7XXdMh6PwtIiJy4Rh
	2ylN1eXS5pKhqC9IufL1Uqzry1QQo0RpUoDV9USNeY4CwE56qIa2pZGJfvOHdaEDv2lmZHZckqC
	jwicW1dgPwBkIdq/awkdZdqeQ7pmQw4TaJdvLw3lT6pMEnLoh1Z2UugUUddcbPhFnoUNBceLvUU
	+1e/PfTrmyxTfEjIzAQa+D6kcin5HPJoSd5LHvRDYaCBkGFnlCtePMSYhg1/oT/BWXawtSB2SkG
	uV
X-Received: by 2002:a05:6820:1994:b0:702:ebe6:8009 with SMTP id 006d021491bc7-70941a50572mr2245317eaf.89.1792627739394;
        Wed, 21 Oct 2026 17:08:59 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70903bc246csm3281362eaf.10.2026.10.21.17.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:08:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 18:08:55 -0600
Subject: [PATCH 1/2] dt-bindings: clock: sun50i-h616: export the APB2 clock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com>
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
In-Reply-To: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_170901_008086_065F9953 
X-CRM114-Status: UNSURE (   9.51  )
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

UARTs use APB2 as their baud clock. Expose its existing clock ID so device
trees can describe it separately from the per-port bus gate. Keep the
existing clock numbering.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-bindings/clock/sun50i-h616-ccu.h
index 6889405f9fec..e3318772c92d 100644
--- a/include/dt-bindings/clock/sun50i-h616-ccu.h
+++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
@@ -11,6 +11,7 @@
 #define CLK_CPUX		21
 
 #define CLK_APB1		26
+#define CLK_APB2		27
 
 #define CLK_DE			29
 #define CLK_BUS_DE		30

-- 
2.53.0


