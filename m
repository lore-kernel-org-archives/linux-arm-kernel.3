Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44E2606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JJAo09KN;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kYP/bhF3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S4qcarRIzyPxsuQpd7GLOf5aNbdhnpO7LL1PTtmVaHY=; b=JJAo09KNZS6SIoYMMlKjEu2IRA
	Wq9wLrvuaVPxRMphagTVO0xlVwCNgKJVtzPcoP9jmAPqhbRiRZeljFBWvSoi9IeRdVsD5hhmiS77d
	3eR9UhtTjd+wAIx4l6aLTiVcLb4VE9Iyx9Jhk45PJ02nHe1bMktUCgObMYYWEwnOsWP6didxFr8Mt
	OievBZBY3NOTFu5I2TsxNX8IKSmRgnOi8TTmIW1GlDpzYwdkTsFJ6yuMf5wS+ffCYGtJ1C/VZ6vrN
	gQjeZ0PRcXFkidEtNJLQyg0G2o0ET/U1Eg3yL2W608zHfEZFnoLePcM0UU1TZuIWHLKdc7h7aeAqx
	v8EQ6TMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFlj-00000002kQE-1igg;
	Tue, 03 Nov 2026 14:45:47 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFlf-00000002kPl-3nUR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 14:45:45 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-8b0f59a5fdeso35679777b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 06:45:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717142; cv=none;
        d=google.com; s=arc-20260327;
        b=JDmhtAc9fCxiOa0bNpT2iZPJv7QKijKVLgmZA9RrBBwnnTjq7mKO9h++B87ARa2LCU
         w44GZNZXIvhPxiWWif9FQWypoweOdlN00rLPojtEv+IhcKpZtWjkS3tbmVhRB92vig14
         l1Lqcwm/EBPDbBI3pW3uR225V42QdpEdUgSF2TAh+zuyWN/8QKzS/Wd14ZgamoZkTaoG
         rCXQLRhbs0ExFLDS1xqlVCRUXnkmNJPEzgIBQO9IYMneW94oJzozpUwWuCAg6ZddrCwK
         D0CyxZzuIhjBP+TjCSD6e3j8lUF2rqjwW4c3NWWsuVwWHIsaGWMcgPkENtl7CpQV63VB
         Bw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S4qcarRIzyPxsuQpd7GLOf5aNbdhnpO7LL1PTtmVaHY=;
        fh=C77cUN3kKFf8WiSf1dYVOyWrzsOcQR8LYiEi6KMQabo=;
        b=dMSzO87hfJvr8mbVefDIM5EcjKv26r4647BB4R8hScbnqdGrECvspEDgbK97w9lmFL
         gEoycwwjO0nHVkNtIaV4FDOgZTQLfhzbjZAQKYH4hCasbwMAxWS7E16E7SYleoQ536UZ
         Hu4QS1lPHS2JJzL17ee0NQPbeHvRDHB0kpRXGgkxhlZBrb/rvRT9B3s4mAx6vTzuJTPX
         2OwEwKqJy+q3Dd6iaBWvGfWATdJE7Q4q8hrH5VlnYtcrOK6qLjUCSztddku1eHLfvQm3
         CFg0ms5dEzJyAK/WFR+HGFJmHrAw78nxck70b8MD6JmOks4J2EQMhJp3qK8yN7dAZqoK
         MqDw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717142; x=1794321942; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4qcarRIzyPxsuQpd7GLOf5aNbdhnpO7LL1PTtmVaHY=;
        b=kYP/bhF3ko3JsMhuobiT+jrkBqAYhvX0mwqXbc5jy1ZrfSNTNRJsar3RIXBVzf1PXP
         Kc01g1PtBuCZoMhZsRLk4TT3NOuYjpGOdKZpkmb4bgft5JQyyb4w+0UfQaF/uA5T1okl
         84vCauDm83R3xKTMgs11FFLRsTxBMHNmbAwGaLJzUJ33Mt/eljD3nnnmeByxuvi2Irar
         m0RAtVEzoSxPn78rI0PQpq/OmpxLzjKiKrEIuU6UdQ90DgrTOVki4u0zEiekaynG1fCa
         T3LaLmqTZIptY72fuySQKe4Y3KXeLpZzTBw/FOdQB+Yahcx7/LPYipjuVJEc3IbHxsrX
         NdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717142; x=1794321942;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S4qcarRIzyPxsuQpd7GLOf5aNbdhnpO7LL1PTtmVaHY=;
        b=q28jfGD7vqJH0Vw8BXD6me+d9erd7fgiw3PBFdb4iCpg/VJbsqENOF45LHTX14TnGW
         vw07SdGJMiURodjOJIfcTGYtaRPGdTcvuWHx9gI02CeDginVIgUFWGhZQ49T5PVXRA71
         6raVaAaSMNI6EqOxkJydmB2WU4ubbGJOOq/MeAXoVHuIgLeoxrEnMrOWNVAmLqOolDt3
         pkfOxM3kSqmv9NRvfNaOVqBVQ1tZd+IEeSncYTMcPmpDlf7Xej/DgmmRQFkM3FACymJo
         VqjBCcOxt2vqziM0iJ+uqSIZy9U0FTJ0jhXv1vSeNgautu/t1WNuegwFStIgfR/2EddT
         Cgow==
X-Forwarded-Encrypted: i=1; AKwUvBxXrwSEX7bW8NLF8UHFm1X5ABYOOJTbyp5XBxrf0kcN6jd9Dax6crblpZ0yebEkNXgOsnzWRVsbJWYiCJt5RujB@lists.infradead.org
X-Gm-Message-State: APuU4Z9F6YosbsEp3s7Lv26/JH4eBZ8/NAe9cFfuczHG/J9I8cPQ6ODk
	6CjgI7mI4zFqAu99jppjK7vvn84ZPdrBi8hP5lXHw408gR0MzvtgB8FB7XoDmDllD8Z8WgRuPMR
	JnVIvywDDtOAFWl8FOLwsNOHDN41PDA==
X-Gm-Gg: AYBFou0TRuIJUzQz3vQS7HGKBZw3AEaIxHbsWPlp4eMsaFFrHQf5JmyAHM/mGQdqlIa
	NOOVSrX2wIKDSUMS2VKKjwR6wBvOODUN6oZQNqif+wRdwmV/ftRK0yjP5XplEvdjX6fgM8NMJy3
	0xsOAzw38+43GVM/hDiF7MLTdyXmK9rTAekNYUeoaj6JFx0Z26e3X0063T3I8t/juqpcFX482tV
	3BoUZkPlqdkg1UPqsZBRKkFe9zDyZKDtDCrO8JelpsdAkCNAf0rCDch8cTCAgwF3eWIxiFVKziO
	nBln7FWxvv7Wx/GBS5vc44P7NlzsvOJZovO6tgQqUX5+GTxKqRPsyEnMbjQFoxTY1AVOg91S0n+
	effX8saQ2VwbH61nvKz0sbB7rPBslTc/oqZBZglqwllat4/YGO1FjXoADFW4o6zTpsKCWu6NXZY
	BlFVA7Hrmru1AWgmc=
X-Received: by 2002:a05:690e:1699:b0:67b:e91f:1eb4 with SMTP id
 956f58d0204a3-67be91f204dmr59967d50.105.1793717142405; Tue, 03 Nov 2026
 06:45:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com> <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
In-Reply-To: <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Tue, 3 Nov 2026 08:45:31 -0600
X-Gm-Features: AclHuK8t5ej_tgD9GJGBIoXXh4hckeei19bttMW9q0EtGop8alsm0H9-n1doCqE
Message-ID: <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_064544_753039_F2CAF159 
X-CRM114-Status: GOOD (  12.12  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/3/26 11:49, Andre Przywara wrote:
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks for the review, Andre.

> P.S. Since you have a device and have been looking at this: can you
> check the CPU speed bin selection? I think it's quite wrong for the
> A133.
[...]
> I would be grateful if you could dig into this and come up with OPP
> updates. Many thanks!

Yes, I will look into the speed bins and the A133 OPPs. I'll compare the
BSP's bin detection with what is in mainline, test on the K5C, and send
the result as a separate series.

Thanks,
Rajan

