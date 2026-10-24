Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1413606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 04:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e6pfgNc7;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=sECayl1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YxBmcqUyq+7y7gmZ9dBOvMilScJYMeNzGz+wY+G2j1M=; b=e6pfgNc7yWIqKW
	A5lqI315Vd+0q0T2LpcxOjXc40YZzv7Yu4fCxHxhjjzonBW6ygX9M4EmYeQkbTb1C/si4Rq2lpsdk
	hwRtsFafL6LlMSC0e0vv45Dl2PLB5Hc9wlE9OjZHadNsK/SHvbbaBWv8rcsTI0wGMaT2lFVUmpega
	GPp//0JzXXCMmjrzgpKSy0VzggutD3G6N8NGibk9uNyk7aSZukkLfk770dr9abVbMzFQPdVP19cKn
	BN8r2lC86Vcq7qvyLsxnnjgfAMYWYVHSpWFHeQv18v2T7EvorzfqA4PWERt78wck31v+GXn2k1Lmo
	tbK3VMZKVgmCR1021xvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKThg-0000000HRKq-0uDc;
	Sat, 24 Oct 2026 04:50:00 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKThd-0000000HRKB-31NP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 04:49:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1322746f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 21:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792817396; cv=none;
        d=google.com; s=arc-20260327;
        b=gnrWp+a4s5m9ehIYsbI05KudWccFZ0FHiUfhL7dSXCa5qbdThNAr0Sj9z+zTkDA5Ne
         WcP0EckZRsr7MslfiGQFWltiIM1ARoX2uGYNKPkVwyJAS246HC+r6qE089bVuIELOw+M
         o+I//tTZSWWarVwA34KS1R0Gt7yaLKyH816s0Tlskq3ltMye8YblXeTspUVvRQvcbhZ3
         8Ak7K0Stlzcq3+owW7dRr4jVYMMTWaLslCKT501oAL0pKsa62Taw8CzYTRtN00H8KgCg
         /IyLnSCT+3jIphfu1aF6k8ZP3qfaK15ToHi3OjKoobiwUeyQTtYUhaZ6lbTGCVyMEDuB
         Fi8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YxBmcqUyq+7y7gmZ9dBOvMilScJYMeNzGz+wY+G2j1M=;
        fh=/IhpczmWZOk5Yukv2FpfomXLV67i9eN3f70VtyBT2yo=;
        b=kkDk491SpqbRckFe0BYxQDT8vDzckQsk1vU7fK9AAmbR0H/6tYv0e3doy2EcRRRt1Z
         w6Nmm4k0RfI7ukY09WdLYtaybfD4EkjJZ6ibVVs+7csM0BrvXnAQ4OUtuZbxNCMoI8sQ
         qablC2GzMjiug0+uBjkBCV4+IOb8hPwS02X09u2YS6FrdRBV4CZcRlQ5ep57sC4/fGXE
         h+dFVfwVofZE+i7Sy39R3MFT875/BoSsk0o1hlS4PigqozYKbHqWl0nbNKLo9pjdoOQq
         Q17EIDzWhJ+YKWy9cK59m7rceMIgYsBeICJDz/QzWhO0XFx8xrwLzbuECfTvG3gfLsjc
         4wpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792817396; x=1793422196; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YxBmcqUyq+7y7gmZ9dBOvMilScJYMeNzGz+wY+G2j1M=;
        b=sECayl1aop5fHi4z/XYbzXPs3grZ9QsxxwrPtTAvafHQxT2WonBwdQ4uCUaZ/u66W7
         OfQpFhrDYqaNVGa23RBClC2f6AZadwTPXbM6P4n1D3v8sBY1P8YGbWtn6jn+cbgcjbpm
         HrDBpCqRZ4MLtNrrphWOWmPgK2YeiNYeBDn2S8CCcMoYPguMuGxeWoPVH8RESL84V+hG
         s02G2lqX4VqnUhTiXhxqjUxGD/YmMsBDUAyIl18rhOinAdDFLucl6USoV/43RNYmFAKg
         cfKl2iFXyPghhRzDBnYLHAVYmunQIj3DZuFeHf5qp4pU6PVZXi5gMZ5cQ86yPRFhnEoe
         dV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792817396; x=1793422196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxBmcqUyq+7y7gmZ9dBOvMilScJYMeNzGz+wY+G2j1M=;
        b=ZgkV7RBujMsIBIM9HS5Wx8IkuhH5S2jqBF5Z4mJtEe+dQq3st9mO9qx8ackQZUPqEb
         4MF/ke7zeaaVlD6HKevmlG+JLavpILvdxNCyQPlSXw1e6Oh+YGlwy69sEDVasSsJN6QJ
         tYpYHFpkDW9ugTcGd3E3hH6rAQm/rgiRDUraIxuaDZnRNpboLvOoKUyL3/qN3TEkWPs5
         nAV0W4JraLsvnjcnH1khrXxuGiCIh0cmViIdqf/zC5Dh1Y+QiT50QnNPNNRZVfXGcnga
         A/Gp/R0dp/qdyvZLYBYiE2s6yW+eDkw1nFJ+MjZ55ngVtpOHByM6kfiSwRw8QBD5Irh/
         clwA==
X-Forwarded-Encrypted: i=1; AKwUvBzlah63MDkDYNad3B9wzmjbLTkliHdnJAgysGPEejjEgo0ZEKEQt+tsZ5EhitFhPC5vH0rUwadYKFADPOljDwH4@lists.infradead.org
X-Gm-Message-State: AFq9FYJUxw4EmlzL37ymQ2SojwMVmIrlcAEqdC7+YOw1EyP2I/9zD4uQ
	OmhE/fg+A9x8y582ycJN0zZK3nHzLMsBaK2gGjv0f4qS0+WeyOXvFE5ldgOEFy0rHsxHnQRHxmz
	tVFdEOhgJFREqfTQzdGndMsxwyUPGbaaXqO38Y4pLV0cZMeW2C1Gv+tg=
X-Gm-Gg: AYBFou0Kmkae+RM16dQAkuGbOBoTu1AhnkvxsPMYs3RlNKixzOc/1sZPSdtXswswkAN
	MXmPzi/yjGcjhzfzxvhxuhouRhZW1r0XSYHk9SR8tz08ZmAxyX0VlRQYlBcOZy/xHPlknCYppJM
	tqTArRBQB6NuFFnaAssi/kt66XP2b8ui1PzoAbouW7xG23F7yyp+vJsY2MB+EwWbTsvT3V5OKf/
	wftDiuolHO4qm0+zrVswEp0Z5YlaH110fN0QFBnrO2LT0XfHJxb8HfOzizAVPStorOISZDm9ASe
	ToLHPaYvI2DSwpvLPCpeuXG6HqczVKOQs3QoPhZGYv6WwXgQxzB5AlDaoU8w7QEtPWNP0a+EHMc
	AKAqj+1q/JqzBh61PBCSildGw0tpBkrVhv6BBynHxp0nqGfLeitJBIlyWFJ4BzxfOzDNr7XB3Qz
	ar3AC3BZWCQi7PVLaa2hMwjBYTHjwL10tz7Lu6930dbn9s8/9Lo7CbR6o=
X-Received: by 2002:a05:600c:3e10:b0:4a1:e01e:1927 with SMTP id
 5b1f17b1804b1-4a35ac8d939mr12203795e9.5.1792817395557; Fri, 23 Oct 2026
 21:49:55 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <caplitmus-rv.75b0e9ee82984422ba17d833767912a8.d33@163.com>
In-Reply-To: <caplitmus-rv.75b0e9ee82984422ba17d833767912a8.d33@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Oct 2026 10:19:44 +0530
X-Gm-Features: AclHuK-rwyUpMrCtlF-8OzUUpfS51mxj7irl2dKCroJ9WfO9LDr7DIESO4VEff8
Message-ID: <CAAhSdy1UwajY2P2ca_h0NUd2v00TR18go0gGNwRTxd66HQxS_Q@mail.gmail.com>
Subject: Re: [PATCH] perf/riscv: clear snapshot setup state when a CPU goes offline
To: Pengpeng Hou <hppiscas@163.com>
Cc: Atish Patra <atish.patra@linux.dev>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_214957_894968_881C08A4 
X-CRM114-Status: GOOD (  20.11  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Sep 6, 2026 at 9:58=E2=80=AFAM Pengpeng Hou <hppiscas@163.com> wrot=
e:
>
> pmu_sbi_dying_cpu() disables the calling hart's SBI PMU snapshot shared
> memory but leaves snapshot_set_done set. When the CPU comes back online,
> pmu_sbi_snapshot_setup() returns early without registering the shared
> memory again.
>
> Snapshot operations on that hart can then fail because the firmware no
> longer has a snapshot area, while the driver still follows its snapshot
> paths.
>
> Clear the per-CPU setup flag after snapshot disable succeeds. Retain the
> flag and the existing error return if disable fails, so a failed teardown
> does not claim that the firmware registration has been removed.
>
> Fixes: a8625217a054 ("drivers/perf: riscv: Implement SBI PMU snapshot fun=
ction")
> Assisted-by: GPT-5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
> The issue was found by our static-analysis tool and manually reviewed.
>
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 50220f7b..f38a64c7 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -1175,6 +1175,10 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, =
struct hlist_node *node)
>
>  static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
>  {
> +       struct riscv_pmu *pmu =3D hlist_entry_safe(node, struct riscv_pmu=
, node);
> +       struct cpu_hw_events *cpu_hw_evt =3D per_cpu_ptr(pmu->hw_events, =
cpu);
> +       int ret;
> +
>         if (riscv_pmu_use_irq) {
>                 disable_percpu_irq(riscv_pmu_irq);
>         }
> @@ -1182,8 +1186,12 @@ static int pmu_sbi_dying_cpu(unsigned int cpu, str=
uct hlist_node *node)
>         /* Disable all counters access for user mode now */
>         csr_write(CSR_SCOUNTEREN, 0x0);
>
> -       if (sbi_pmu_snapshot_available())
> -               return pmu_sbi_snapshot_disable();
> +       if (sbi_pmu_snapshot_available()) {
> +               ret =3D pmu_sbi_snapshot_disable();
> +               if (ret)
> +                       return ret;
> +               cpu_hw_evt->snapshot_set_done =3D false;
> +       }
>
>         return 0;
>  }
>
> base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
>

