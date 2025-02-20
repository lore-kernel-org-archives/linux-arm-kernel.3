Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D153FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 01:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hei31XB5q84gJBI2emRDlm0CWOqQ1amJYg+XT3qGNfs=; b=VTus6fmp2Y037LxmyEtMSrrG61
	gp3lyEmp9OXZ1QvzWeBmKfpIBaxkLu1Qbv9gtga8lkSVONVfKPOoJiJHC+++Fue2fUEDP7IK56zAe
	XR2bKJWRtGp0coBuvxkwVU/qeCDGByN9Xw0ibA8fnDZsGyigsED+F+LvWOCU0MA3YSE5Mg66gx9CG
	P+Sh2QTfNrajfVzmsW6DfoZE7nFxKL//zoUyFU32mRVjiMn8CmTbMZgkXRJ7h1H/weaxo/mJYuZJS
	IQw+bs2tYVZvq3P5i0uhD0KiU5BdTfzZc8XiCjTW7gyHG8iejyFpZ06EYoOu0mRO1DX1S+TWX3Da8
	JHczWnCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvMq-0000000G7BD-34fE;
	Thu, 20 Feb 2025 01:28:44 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvFk-0000000G54Q-2LkF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 01:21:25 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-5fce3f2d8e4so234870eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 17:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740014483; x=1740619283; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hei31XB5q84gJBI2emRDlm0CWOqQ1amJYg+XT3qGNfs=;
        b=XyAQ0QGyEgDgjC7hzuSjXq9YzM4nlR6WMLTrbUCBi0AAZQQKui31diBU3918ppZzux
         Uy36bu+52lHOfqGNuHNZw5Vm+IAhKbesMwF0SHN2YBkW/IPKdHDNh3niCS0mKHNg+Ks1
         Lzx4m8gIZOOc7k+li6/em59M9T4KmeLFcY6VdjQFeYlLQ5cciBlUCTmQNYMA5TwpFta7
         du9Vh0HuHfSKyu3nhn2QZzbFFUf7vzIQH4elF8ufmlDpe7MCC6ucqfhL2wQpofkYduZa
         VND6XyeG6s7WQkDvUdZ1MNPA2QfLskAg2vLJe1kRF5gZei/F0ZfJR3FbLgqql5Oy9VqK
         3edQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740014483; x=1740619283;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hei31XB5q84gJBI2emRDlm0CWOqQ1amJYg+XT3qGNfs=;
        b=TOOqipV3Ljdr0hk6/djKLB5poYr616qpOm3f2o2+f5hUk51+26zyAbk3FClMgl8VA2
         blZrS5+n25T++PlJhx+hV2y6jE7wym89v+2nm7WM3QdKEhXv8ImwcRblkLfTLHVArPmZ
         DslWGHc2gil05HE9NHB47YblOCNa2Olg9taLg0clonIs0CcPIs4AQJxKTCO8s/4Exqn+
         1VigoVZ2kFOO6XKchBPGaAQl7Cvw3iIRMA9WTPvw/pD3YouetZ9x3IRpJu+edxzhzgoS
         L8OqICPYCyYD3do9zKfsgiF6uFGrTmkkODpQGV49VRIbN8YJwJbUTRpy/XHtyLpwnfeV
         Ej6A==
X-Forwarded-Encrypted: i=1; AJvYcCWknU+mAJqz5mi/QmewE6lPhZZyYpoEu+Yj1FXw8RTFXfkoKS5ZP6MMyH52toSxk8ma5LvgVtZuwpD2/EXsu76U@lists.infradead.org
X-Gm-Message-State: AOJu0YzfzBQ8WfQn7MyR1Fn9YY4f6vD3oOy+NOoZ+WXE4yLIT427ecc+
	EqOErIIbg0VAnbQaji0KTPr0e+XpZq8sXzZWAaiUtbPZhyvWoTA+Rdt4OeQL1GPceE5mcuxQRXg
	osvhtMRPHdQ==
X-Google-Smtp-Source: AGHT+IGd2vxuU1amb7+qDvbCnYAoKOoMiZRrGABm5B0rQidw0j6221m951cHdyKwGYS7pdZw4DijvpwPVgm+Og==
X-Received: from oablm17.prod.google.com ([2002:a05:6870:3d91:b0:2bc:69a2:abd1])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:fbaa:b0:29e:5de2:cffb with SMTP id 586e51a60fabf-2bc99b721admr13444186fac.17.1740014482734;
 Wed, 19 Feb 2025 17:21:22 -0800 (PST)
Date: Thu, 20 Feb 2025 01:21:19 +0000
In-Reply-To: <cover.1740009184.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1740009184.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <6888a87af6ea47ea29d429b91a57cb146d1f69c8.1740009184.git.yepeilin@google.com>
Subject: [PATCH bpf-next v3 5/9] arm64: insn: Add BIT(23) to {load,store}_ex's mask
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Peilin Ye <yepeilin@google.com>, bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, David Vernet <void@manifault.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_172124_597695_36970E0E 
X-CRM114-Status: GOOD (  11.53  )
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

We are planning to add load-acquire (LDAR{,B,H}) and store-release
(STLR{,B,H}) instructions to insn.{c,h}; add BIT(23) to mask of load_ex
and store_ex to prevent aarch64_insn_is_{load,store}_ex() from returning
false-positives for load-acquire and store-release instructions.

Reference: Arm Architecture Reference Manual (ARM DDI 0487K.a,
           ID032224),

  * C6.2.228 LDXR
  * C6.2.165 LDAXR
  * C6.2.161 LDAR
  * C6.2.393 STXR
  * C6.2.360 STLXR
  * C6.2.353 STLR

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/arm64/include/asm/insn.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index e390c432f546..2d8316b3abaf 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -351,8 +351,8 @@ __AARCH64_INSN_FUNCS(ldr_imm,	0x3FC00000, 0x39400000)
 __AARCH64_INSN_FUNCS(ldr_lit,	0xBF000000, 0x18000000)
 __AARCH64_INSN_FUNCS(ldrsw_lit,	0xFF000000, 0x98000000)
 __AARCH64_INSN_FUNCS(exclusive,	0x3F800000, 0x08000000)
-__AARCH64_INSN_FUNCS(load_ex,	0x3F400000, 0x08400000)
-__AARCH64_INSN_FUNCS(store_ex,	0x3F400000, 0x08000000)
+__AARCH64_INSN_FUNCS(load_ex,	0x3FC00000, 0x08400000)
+__AARCH64_INSN_FUNCS(store_ex,	0x3FC00000, 0x08000000)
 __AARCH64_INSN_FUNCS(mops,	0x3B200C00, 0x19000400)
 __AARCH64_INSN_FUNCS(stp,	0x7FC00000, 0x29000000)
 __AARCH64_INSN_FUNCS(ldp,	0x7FC00000, 0x29400000)
-- 
2.48.1.601.g30ceb7b040-goog


