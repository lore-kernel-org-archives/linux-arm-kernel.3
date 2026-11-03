Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEED7606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O0Jr5T6A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YNY6h4Csi0xCblDGgiFLCrE5yAWsa766ysMezcggLVQ=; b=O0Jr5T6AKzv7NvFHBdnAMh5LPl
	5bWf1/vHmQ078W+dbNXbpHnSceWT5FwydTSCNF0FgTOOYQjIsbi6hfV433shziqrK02DMVJcaAweA
	YzCqMXBHlpEO341OVIZ5QcoSPhco4KkKEOSAFjI2V3KK+buFNYvBr7LOUQVUG1BsPgT2TFYKwxAwu
	JyICE1R5WQbXvfGjGkVPB5xBefOX7If7zMs+WDjkESPsAnMt3TeaIhSeFqyhWs6/MA9tzj776ZvIK
	rIYn7WqT1SbUojSDP9HcHPD7SQmHFEQtbe2usn4f0uCvl/NT38TFhNFVgOwSpfJeSib3aPbt7xAwe
	PoYzUYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHO9-000000037vq-1WX1;
	Tue, 03 Nov 2026 16:29:33 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHO5-000000037uV-2Fac
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:29:31 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b06c0794cfso40618337b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723368; x=1794328168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNY6h4Csi0xCblDGgiFLCrE5yAWsa766ysMezcggLVQ=;
        b=BXodWNoKN/ZUlcC3m32nQJ2Dh1FTnKXIsYg75WR7WkeiXN4spoC1IbWgcUP8qhA/bO
         wY5ui3U9080HzbPIiUPeQGGlKZzgWvVx3QhfMOdGaT8M2kgn3jeth3erm7SQMQoiZb1O
         s1GEilGx05Eg3skM4j2K9dX8ABss4xXTARUeYOxNnuBa/XFjgvDNvVeitN4Taz9r5/vK
         Oc8F05LgUleTxb64lIyo0ZUTRwq69hR4M5+2fZ2FqNLoj6rNO5p64oidmWtftuMFMX19
         kxVIRVQ18tbu9iLAtRTNjs0lT9yqOTTDtBK5SUy8D9n94gcOt7Tm1+zSoQn9DjODgnbM
         F+sg==
X-Forwarded-Encrypted: i=1; AKwUvBwfClsI1sj6R/EzjiziAilJrBa8UjniyeDR+aGqwy1LK/y+WLXNEAwUfuaD+UJDAiKFcN/A+VxJJm3n+4vRw/nH@lists.infradead.org
X-Gm-Message-State: APuU4Z+TzXxXKQeZOWfccR8JytHejVe0AvLBlKfJ1QXopKdLRJJcGJ6J
	7aT8N6nfeuOAPg/A0QY+PFGQFHt2tq3eb1DppaLtCdzzIBTmug54lEWg65vpOu/nNso=
X-Gm-Gg: AYBFou1zKE02NSkK5lLUJETzSKnwWNV70lNKHE6hPKcUTwlV+eZuRHvy20TvuPchb/U
	EyBYTsgZx14pIARBO9u6nL49aUH3D8pnsNLD3KNleVyVTKCzL/CA8QfzJiHzwd0yUCCDvHLBS/d
	+vHKCdFx7s8zZx2wN62idaeq02KwVrMtLR2eoquRWAwrJ4BTV1d9SBWfWTlBE6yDaJZXxqWjFUg
	J6/gw0jfK6ZOwEPFvxJFM7LKSNRomgtkIC18a4iU0jBSlwsny+n9Y28ciVbV8ga1k4Qbw9xtVlt
	SgQa+phoUt1YCNard0eWLVLlaIadfgWRQQi8yHXBRqp6+j0xgnOLiDl31ltukhaU84ZhNyLHBYW
	UD8JxDdM6W+yTIgjbazfdXT6mNA+Wmn4nO7qv4cgXY3tU1foJeCFOERJdQozHG4MEY3HeSKnLsp
	5d3GOygI+4sqiRBx6a47eQLpndGYCZFp0Q9h9EbChvEMhaMVQK654ntzi0nf5kJeF+a/+NW1ilh
	kV7NrEtJ1vW5bDHPR+4EFDURjxNMaHZ1JgUuRZQ9cniZE9Kw/9oOozmUuOZPPNdNDCuH2sqAmLs
	3hiXcIvk6c+HjPuYXiHYKIrg+VGxTgcgfKiAAlpMu4vljm8l7yF5E12ak6wqF6sJLf0Cwcy3oll
	EOytJ4ur9QHlN+6uc
X-Received: by 2002:a05:690c:6e83:b0:8b2:91ec:57e0 with SMTP id 00721157ae682-8b2b679796dmr108791117b3.59.1793723367568;
        Tue, 03 Nov 2026 08:29:27 -0800 (PST)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com. [74.125.224.43])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309936bd7sm113617b3.20.2026.11.03.08.29.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:29:26 -0800 (PST)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67a79750749so2766338d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:29:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwhy0frnAh9Q7XYckGkw9y+0wMc+G9DiwfbUNK3CY1eCwqJGzPCIgpno7CUPUxA5akvWD7xhD6JrG1ZaNeIYKqL@lists.infradead.org
X-Received: by 2002:a05:690e:1c07:b0:676:8974:9795 with SMTP id
 956f58d0204a3-67ba50e5d1emr10529834d50.92.1793723366247; Tue, 03 Nov 2026
 08:29:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-3-tanure@linux.com>
 <f8da1842-bdc0-4bf7-8f15-46b57a9eedc9@lunn.ch>
In-Reply-To: <f8da1842-bdc0-4bf7-8f15-46b57a9eedc9@lunn.ch>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:29:14 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3hxekJn1FiDJjYqDoCFyczxzvCuQJwWQ1DbH_WXjihOQ@mail.gmail.com>
X-Gm-Features: AclHuK9_PvSlgVJNQpbckdVoDA5-AvRndijSeKC1Bujpf2P-dAJH6DOiVyEau-s
Message-ID: <CAJX_Q+3hxekJn1FiDJjYqDoCFyczxzvCuQJwWQ1DbH_WXjihOQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_082929_582228_777FBDD9 
X-CRM114-Status: GOOD (  12.48  )
X-Spam-Score: 0.6 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 1:27=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +        # The PHY adds the 2ns RGMII delays, see ethernet-controller.y=
aml.
> > +        # The RX delay line of this glue is fine tuning in 200ps steps=
,
> > +        # added on top of what phy-mode describes. The TX side has no =
fine
> > +        # tuning: its only step is a quarter of the clock period, the =
full
> > +        # 2ns at 1Gbit/s, so the TX property is not accepted.
> > +        tx-internal-delay-ps: false
> > +
> > +        rx-internal-delay-ps:
> > +          enum: [200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 200=
0,
> > +                 2200, 2400, 2600, 2800, 3000]
>
> This is good, thanks.
>
> > +
> > +        amlogic,tx-delay-ns: false
> > +        amlogic,rx-delay-ns: false
>
> Maybe add a comment that these are deprecated in new SoCs favour of
> the standard {rx|tx}-internal-delay-ps properties.
Done in v5.

>
>     Andrew
>

