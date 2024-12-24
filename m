Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07B3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 07:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYfPZ39MyRj475906l0HgxSRj//ePs6qi2xtnlendVw=; b=XWbjufHl56BKTTOHEnIzg9LUh2
	atEBjMNAt1XMeTqHLrCGW+XgNszsvuz9K0K37PSx/c15XA4dvm7GVCyT58w4l0beLXz/Sb5LYAaZT
	O9TOy3kH2QidGCx71sGEpv2p7fmSiVrmxJawxbf4NbpfWEMPpfQaqjKNbYCn1VCwgu4KwI+G1QX7S
	pf04fn68SAmS0poLWhL3Mq63xW2EoTQ68T7AOjacSp+vRiGFk9IZpDrUb2wptzE69pMi9ACGnAbrs
	xtHx8SvNkkcvRESW/treQdObwxTX2964rlPNlh2HJUheoqyGWZko4t1q4asr2n8i/vPw7UbU3mmFe
	UQLzsCRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPzn9-0000000BSaw-39fm;
	Tue, 24 Dec 2024 07:57:23 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPzlx-0000000BSU7-1WK0;
	Tue, 24 Dec 2024 07:56:10 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so8466438a12.1;
        Mon, 23 Dec 2024 23:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735026967; x=1735631767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DYfPZ39MyRj475906l0HgxSRj//ePs6qi2xtnlendVw=;
        b=SY1g6AXIdoHfREPckFKl3llcjUIUF3TmBWjVrdn5MFXSgLqgNxOPBiJGN+eODBaGmJ
         upANpZDLzGuGVe7Z9HbNOGPEPATAY8Y8qnR8rXmYQ/e0df/SydiOlE08RjMvFj9Jphe1
         g2j/GqXvYHyiuisFPbr2Ddiq7ZPTwBD81gwc035CI0KbenISyWKeT6xrCIIL0d/MfJwI
         yg0oGRncqqa5+zi07z0K+sQ5sM4MEob78prbaHy4jmf3xA01cr+5Tjvio0i6nQphJmhH
         PC2rwwrGdcf3WWfG8sGb4yHmRTvq7Eou87LJRw93zNwIRizn9bw3X7ZcLpAgVWo5ly+n
         nlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735026967; x=1735631767;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DYfPZ39MyRj475906l0HgxSRj//ePs6qi2xtnlendVw=;
        b=rIeeOTM3LkKpkPBKemqZE3p3zfYMbiR5Oy2kLdb721qfAFBxpVTUkgq0ZqOxAfbTdR
         LC9IScKOaSY8r/Osk2lQc/Lef0YKtAaw8VDd4acqaXRuUnHlhbODgJnlSAC77ab5tYA+
         X7SU4FCpxqPVIUbGDkoWH82og40cZ3yFW1dxhutVGN43f0KqZjXmTiDXB85V+ug7JrmJ
         cmF9lvsRcSKYNE3jVwIoUNW2TDMvfD0J+84+H/k5Fy/uo5do6OmJX4hfYI3dCa20BBCy
         wzNQAvFcbTcj0uXtKje5hUtZS8LoiR6Iu2d5YNspyYhdOTUUJAJkGjSQ0iqPBUFGLkF/
         RUuw==
X-Forwarded-Encrypted: i=1; AJvYcCUpqcbnyN4glt3WU21nsLATv680DgDJLkKi49LmOSmHOmmRH/GUqsY9jhZ4A+BRxPqPO34EV4OpOpTLBd8bHsA=@lists.infradead.org, AJvYcCUtMu9wV483nffMJNZ3fZ0w++NK0gdbsM7XfOQ4z+ruDFVQ4PBz3mEL3EWzOB9q67i964wRvYPhIKN3JXdmi69i@lists.infradead.org
X-Gm-Message-State: AOJu0YzUOTCqfFabl7smViIGmU+Mk4ltXoridRVrO/y9dsxc+aG2KB7I
	hWBCNAY7FZbbP/k784CPPOOeig/F14dNmhy58fF6XQKrTTQvWgkG
X-Gm-Gg: ASbGncvIGIcSvPrDseXhdbNADKkpB5P8DWJbCDbAWBiKYyDn7y7GkTLhDLzEF919fIA
	hKjy8ciGsOZOm1VLuB68zKJ0NxMjAObLXOqBTuTQOEAJe6yntg6lhT+vMb0M64H5qTYvkr1fmS1
	BO9cPMzRte07aVeiDbi6Z7UtDAL14XN4oLoc0LL5hBM1m4NPXQ/I4qN8rEl2qhrswbfZc2R7DSG
	GVloiv9nqttvghHaYVf61RQEOigSF8NYIbYCZUHpPNTjKnIg6jOBps0pQ==
X-Google-Smtp-Source: AGHT+IH3nULCTvzYbryqDPG24PJWH+1wwHyXoPc9vgdNt1AHig0ol6/zEmoM9ghe6monEtsb9DhNhA==
X-Received: by 2002:a05:6402:50d2:b0:5d3:d917:dd90 with SMTP id 4fb4d7f45d1cf-5d81dd642e4mr13413925a12.6.1735026966591;
        Mon, 23 Dec 2024 23:56:06 -0800 (PST)
Received: from [127.0.0.1] ([82.102.65.251])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a6d0sm5864804a12.14.2024.12.23.23.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 23:56:05 -0800 (PST)
Date: Tue, 24 Dec 2024 09:55:00 +0200
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
To: Jinjian Song <jinjian.song@fibocom.com>, chandrashekar.devegowda@intel.com,
 chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
 m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
 loic.poulain@linaro.org, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
CC: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, corbet@lwn.net,
 linux-mediatek@lists.infradead.org, helgaas@kernel.org,
 danielwinkler@google.com, korneld@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org
Subject: Re: [net v3] net: wwan: t7xx: Fix FSM command timeout issue
User-Agent: K-9 Mail for Android
In-Reply-To: <20241224041552.8711-1-jinjian.song@fibocom.com>
References: <20241224041552.8711-1-jinjian.song@fibocom.com>
Message-ID: <CA4E0537-84FE-4E1A-8BB6-7636D3799E39@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_235609_444153_40F383D8 
X-CRM114-Status: UNSURE (   6.36  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On December 24, 2024 6:15:52 AM GMT+02:00, Jinjian Song <jinjian=2Esong@fib=
ocom=2Ecom> wrote:
>When driver processes the internal state change command, it use an
>asynchronous thread to process the command operation=2E If the main
>thread detects that the task has timed out, the asynchronous thread
>will panic when executing the completion notification because the
>main thread completion object has been released=2E
>
>BUG: unable to handle page fault for address: fffffffffffffff8
>PGD 1f283a067 P4D 1f283a067 PUD 1f283c067 PMD 0
>Oops: 0000 [#1] PREEMPT SMP NOPTI
>RIP: 0010:complete_all+0x3e/0xa0
>[=2E=2E=2E]
>Call Trace:
> <TASK>
> ? __die_body+0x68/0xb0
> ? page_fault_oops+0x379/0x3e0
> ? exc_page_fault+0x69/0xa0
> ? asm_exc_page_fault+0x22/0x30
> ? complete_all+0x3e/0xa0
> fsm_main_thread+0xa3/0x9c0 [mtk_t7xx (HASH:1400 5)]
> ? __pfx_autoremove_wake_function+0x10/0x10
> kthread+0xd8/0x110
> ? __pfx_fsm_main_thread+0x10/0x10 [mtk_t7xx (HASH:1400 5)]
> ? __pfx_kthread+0x10/0x10
> ret_from_fork+0x38/0x50
> ? __pfx_kthread+0x10/0x10
> ret_from_fork_asm+0x1b/0x30
> </TASK>
>[=2E=2E=2E]
>CR2: fffffffffffffff8
>---[ end trace 0000000000000000 ]---
>
>Use the reference counter to ensure safe release as Sergey suggests:
>https://lore=2Ekernel=2Eorg/all/da90f64c-260a-4329-87bf-1f9ff20a5951@gmai=
l=2Ecom/
>
>Fixes: 13e920d93e37 ("net: wwan: t7xx: Add core components")
>Signed-off-by: Jinjian Song <jinjian=2Esong@fibocom=2Ecom>

Acked-by: Sergey Ryazanov <ryazanov=2Es=2Ea@gmail=2Ecom>

