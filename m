Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E29CFF60D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Rd6dD12J+k4M0RPgh3c+Z/bVpfV1NbJVTnDkgOMtLc=; b=VvWMqT5X4x5b+VbEPfC8LnY0Sb
	7v9NTYI+C4FARZfESBQKpS/0nlqoaWSlhM0tBqipLQ67jjYslbiMqG0OuVOSa7nQOOP4OpXiaJfV/
	GNhH4Q9z8kRit9dppJBeC9/Sl6m/RfXGg+5Fn7rA4Awu/jp3ZDXScRUuf1cbWTzRfyVOB5qI4lVXo
	vJzItW06qVgnWzGtgi5SuvUyhyqZDVH7Edx8dgBij6hXtDQnSN/IK5mc8ZY+apaQBsUBcGNhBJvtv
	TH/v5Ftj+Hw5fAMdA1PTjCFs34zWbrvPCB1ffpK0uZlVxwYupaTiL2KjeSxLa8lq4RIm/U2KBmA+2
	mzdicDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Utz-0000000Cdlv-1j3l;
	Tue, 31 Mar 2026 08:56:47 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Utw-0000000CdkY-1T09
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:56:45 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50912a097b0so31330951cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 01:56:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774947402; cv=none;
        d=google.com; s=arc-20240605;
        b=H5f9wwN2L49XnI/l/CuWDyuS+ESLKq/tl89d2JTMuEyfjLgcj//Jv0s6RI7RWtsO5E
         GuyA3rlSV0uIS8ERf1MrUAqgUvBf36OVNB2cx3DlnZbqj8E4GGPATXFZnvdNMokkvgQV
         5bQoFT3bV6fwUlB2eIWjSiG0Ijv9bcpr8BWl7sxJQet+JPSSuRQtocAlalrZdaA0YcPx
         3j4849ULfkDo/y7+odwga7AnrSLDHAs2x+REk4EQBA7feVMCYIDpkoc/ecKWVa7jG7CP
         L4A+njn5kh0irvFMl42Kunc7c3+r/sy3k8HEQWuITr+WsY/TAJhEMecq0BTdhfdR859Q
         DVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Rd6dD12J+k4M0RPgh3c+Z/bVpfV1NbJVTnDkgOMtLc=;
        fh=0jg8RiLXeVnx/IcbEbKcXLZpHEkqqolcwTOyL6xQmOY=;
        b=NJZMX2GOP321juwZdtfQfhPN6Bu+fNl5qodI8dd/5pQ9oEE2BLuztp0xJS+cOHX0FQ
         w5y3GnVhLGTormYi9N/r4VGA6xpzOc6XdCoGh4K4PrskzbQdaIW2bTmSJEuRxZqwovmb
         v5rEPZorUv3RREAWxQ7B3g4Qvr8OjKK1UVbO1/BeBMEAhY2z8NxhR7vE3UDvjuDyfDL2
         S3xZHpXBnQCcXqxDxl5wKMybfvFqYtlGzb+JSrukAs09RIGaPlPn1m5RjcYjiKihkrSS
         JMoHwPjTPXzJms/aAjE+/I/RSVi6S6MHXL7xx2Us2O8bAY2sSYxK6/8t1hhrVElH2zws
         wuTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774947402; x=1775552202; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Rd6dD12J+k4M0RPgh3c+Z/bVpfV1NbJVTnDkgOMtLc=;
        b=frjpYXbkuxX/2GX1GIAko2lY2GEog8b45+7eaaDIrP7HOjyOkVHIjAz0oS31iz6L+8
         6NwYM4/hE6sKylmN/FEMhL7GQSMmVWuMJSoIwNf+43rQFymxYAwJPFUMDyDLbwvo2cyW
         i3saA3Iq5tbQjBPwwxauNl3thfO5H9FmqQvFRY8NFEg7PUm8OOWswPoG9JJSYsmM756l
         yY1hIg3elFH+eSdCI7A7+/9B51DT1ttW8Sx4jJ5c+6ly1uYKnnPCFoWLNCGt6znqbWv7
         gtiDS4a+HfRs1DM6ETZEoNqYEGwED9l1R0D3VlMmvXcbXhF08XacYiIT1C0OoYT1nswu
         udOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774947402; x=1775552202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Rd6dD12J+k4M0RPgh3c+Z/bVpfV1NbJVTnDkgOMtLc=;
        b=If3keA3vbStrlFNBrp5AhgBfwzaqEwZflgvuH8CRzjVSMRBKIAETECeKDUW+SyLCgc
         jQ5gYfdaxZ6v+qY/G2CLyjUsMiK0B+NcofzmyxcbdHpF8zNGeoQoYhRIiQ/cPVoqBisS
         39Bp3EuyG3qcGfID5rcjPK+AI0k6dLisyOr/hs4QQVhCcVOd9QFCGJncRvD5684wSBmg
         +C3C1Kl9fizwb2/1qnjE+zWOxzrUIXFg6LmK2q7qNzQVRLhvHaHCyfjabEJniLrhGtDo
         uSK/QH+L5o7haor2C6q+AP4fwdRabWyFNEFU0hReQE8ZvhoWqn6fhYiuJd8OSz875blj
         ISpw==
X-Forwarded-Encrypted: i=1; AJvYcCWNX08NsTGZ0CUQUHzs7oZxsSExrQOQrGmTW5wm6/0HSx4vm9cB46gTbJs5wvHKhcibodMMtYs/pAvzMhVaPfaY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw68q0lWk2iH3TdD3Jd6uefLO1ZYlvdPlnkxixDCyurzyLqcyui
	qSsLKu52KD3pCU6Nr+L3dXOZGTpoDJT9wlqPuC30259yl/BaXmZ8d3K1SmObLLf3vSLg1Wc6306
	k4ssDvWLggvQLKFNFCU4xxqJtX4TZ5AWxLGrtEzR+
X-Gm-Gg: ATEYQzx/cp5uZ6jwD5OJAa78AW2vLVs5nMlDPSrae1MkNNcoIXNCAkNADCgOI7DTKBM
	sdkRq+xKRthql9V4aF8RAc0ktU6ia2MPlwImFDz7x1PNZcIRpnCpMcFybXdY95xUKH78/2royvB
	0BLqitY39HcBvPxwUupX9hmCEBRZKCMlvR2SgCHaanoKyrwiHNCeHlb7ek+nLrimRHFRuWzgzv0
	EtEkGUvcph8MD1455/PxA//5IjWHub+7FTV2z8EnPJT7geXc+c69Jv8LdtkV40JUwdr3jdd0bm2
	BnUtEA==
X-Received: by 2002:ac8:5f0c:0:b0:50b:1adf:89c4 with SMTP id
 d75a77b69052e-50ba391e5abmr200632611cf.46.1774947401658; Tue, 31 Mar 2026
 01:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774855883.git.zcliangcn@gmail.com> <07351f0ec47bcee289576f39f9354f4a64add6e4.1774855883.git.zcliangcn@gmail.com>
In-Reply-To: <07351f0ec47bcee289576f39f9354f4a64add6e4.1774855883.git.zcliangcn@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 31 Mar 2026 01:56:30 -0700
X-Gm-Features: AQROBzC1VwPhds6KUcUJYr2e4pOAOAu4WSM0cOgN26T1vLQGT08ERd_YmoRmcIM
Message-ID: <CANn89i+-W1j9iE6+DhJTAkcWF2tC1SdREDDx9pDWtNzCFLWMfg@mail.gmail.com>
Subject: Re: [PATCH 1/1] net: ipv6: flowlabel: defer exclusive option free
 until RCU teardown
To: Ren Wei <n05ec@lzu.edu.cn>
Cc: security@kernel.org, davem@davemloft.net, dsahern@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, afaerber@suse.de, 
	mani@kernel.org, yoshfuji@linux-ipv6.org, yifanwucs@gmail.com, 
	tomapufckgml@gmail.com, yuantan098@gmail.com, bird@lzu.edu.cn, 
	enjou1224z@gmail.com, zcliangcn@gmail.com, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_015644_424690_14D157A4 
X-CRM114-Status: GOOD (  13.70  )
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

On Mon, Mar 30, 2026 at 1:52=E2=80=AFAM Ren Wei <n05ec@lzu.edu.cn> wrote:
>
> From: Zhengchuan Liang <zcliangcn@gmail.com>
>
> `ip6fl_seq_show()` walks the global flowlabel hash under the seq-file
> RCU read-side lock and prints `fl->opt->opt_nflen` when an option block
> is present.
>
> Exclusive flowlabels currently free `fl->opt` as soon as `fl->users`
> drops to zero in `fl_release()`. However, the surrounding
> `struct ip6_flowlabel` remains visible in the global hash table until
> later garbage collection removes it and `fl_free_rcu()` finally tears it
> down.
>
> A concurrent `/proc/net/ip6_flowlabel` reader can therefore race that
> early `kfree()` and dereference freed option state, triggering a crash
> in `ip6fl_seq_show()`.
>
> Fix this by keeping `fl->opt` alive until `fl_free_rcu()`. That matches
> the lifetime already required for the enclosing flowlabel while readers
> can still reach it under RCU.
>
> Fixes: d3aedd5ebd4b ("ipv6 flowlabel: Convert hash list to RCU.")
> Reported-by: Yifan Wu <yifanwucs@gmail.com>
> Reported-by: Juefei Pu <tomapufckgml@gmail.com>
> Co-developed-by: Yuan Tan <yuantan098@gmail.com>
> Signed-off-by: Yuan Tan <yuantan098@gmail.com>
> Suggested-by: Xin Liu <bird@lzu.edu.cn>
> Tested-by: Ren Wei <enjou1224z@gmail.com>
> Signed-off-by: Zhengchuan Liang <zcliangcn@gmail.com>
> Signed-off-by: Ren Wei <n05ec@lzu.edu.cn>

Quite a long and confusing list of tags, and a long CC list ...

Please trim this next time you submit a networking patch.

Reviewed-by: Eric Dumazet <edumazet@google.com>

