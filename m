Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00F6CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 02:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QaH9gOttvajLUzldzEp6LSNgexNCpeIB1/EEz8zauI=; b=xB28oF4o4iuDkQhrb7DthI5bdp
	wtJ3rysq4ntXbqbQzxgpAvUOIAQpZ6lyVjlm4pz9oQjhSMsfL9vjeBrS8aPgqrrdRVA2hV7SREoH9
	5g8FhFbxtxe4Kw/UJzeb/tfI3EWM1yLYiysh3K+15oZ0qn2CSnTts800YemDCBkdqPc/XJmEzeGcw
	MiLC4eWQbwC6rRWxHm6B7T2fOapM03rzE6yKH3xbFS7at2K/llbmQdrxPZDrqpOS/laUpFJhrISnu
	WO2z8fZk/3eqak77hvEtzPEhs/Oj4QuyUpVccO3WHLvZVLTAah+jirI7CzP9eCzxSBfU/bHLM+xZ0
	LyftGqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoYti-0000000CCv0-2jfU;
	Wed, 20 Aug 2025 02:49:58 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoYpT-0000000CCcT-3AEF;
	Wed, 20 Aug 2025 02:45:36 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-24458195495so38573635ad.2;
        Tue, 19 Aug 2025 19:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755657935; x=1756262735; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7QaH9gOttvajLUzldzEp6LSNgexNCpeIB1/EEz8zauI=;
        b=lD2NZreDmVIwKRy2A6qCTnUbVHuFsxCyRSZ8yFW6Ehjhbo4dxetgu8nrrIpqgy4AZ3
         iqL3V1F+WwjT6eUh4N3/+Y2IUOL01GskhsaOPQIIMw72XumZ2/EXD2adLcYxv1fWOuen
         leiR7sa6UYdAYUlzCdoJURqAHhvJlj0ORDsE7S+21DpH72gy664dVlM66jCy1uR5qV0c
         fd81L85/M050ETrKM6fa9Wd6qhTo8wnKP6m499iiVEUuCwqDGw+frIbUbrrQ9jeppKMU
         aX3zLiyhSvwpx1BqxNKb8ZmmgiB/cMI651vLzDvZq/lM+ddHBHc6Ni30cSdKNpqYgCNc
         rm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755657935; x=1756262735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QaH9gOttvajLUzldzEp6LSNgexNCpeIB1/EEz8zauI=;
        b=v9TS/AJ6CbV5S+KT3SUOapCJ8qn03HZVQC15HGJ+VjNM2oC45Jnz9hiVMfTd8ppKE9
         v6+Nwjz8O3pIOsP/KA7QEngy+APXR/b4pXTjwyAiOZiiLV/fYy9KK5th/rmV/J1QShZn
         OaId5glMDC5ASVEpjCAF2xd8iRESqK6NzC+re5ZgPc4bXzaSUh2eAQ+byRyN7VvSPFiq
         2Hy8sv9gE7UD6WU3dm1DjhDw4iSoQ9T+XDPH4XIxlfrzVmnEODBpTdTiJDF3Y5bHPiua
         fa/HPluuVZdy6k40gSLanelDgbv9XFfZBQh1GIqSXuA5gPEq/j0bJKSRZt0qOef2/Ovq
         XVRw==
X-Forwarded-Encrypted: i=1; AJvYcCVVWCq26j4TSg70yzGkujnW7iaSTYBMWb9J24ihfFbB8dvv1FRS890QGiDrhkeDUdf0SsGf402livQ/E/M0stmK@lists.infradead.org, AJvYcCXJgn0NkzMMyOLVyLjLmuZytrlXGOVgoygOMksGu1lcqnKOsLiZki8/UYFMt5sfhpFBcJQI1F/arzRrhSEEqYI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfHrU65jMOCMXphzH8DqxbNAZD9cWNK65PWekgc/AGn/EoCDcC
	+esf4w4pgkROXsynicX/AUJm4nYmPkKThRaim32Jd43Nubd9J2y6yBDa
X-Gm-Gg: ASbGncuVyxoRRnnEPwfbV/k9SB0oJMC+vl82qyhSeIyVxrc0GRNq/vaX+3tHdBSKC+b
	w+CXd+aucajluyNX3qP5I9rqMLdTEVDfL01xrIS4bEuuC7N1kM/rngJ5s8aVY8rok+vUvnauD7u
	lETTNcozKjW4BiSvKQLPDLuAgBT4A1RT7rfWYTyBFkjwuGkd2DU9X+1NX89ZhiB08iOrJRnpVCh
	/xC3dnLSFV5KpMZrUuH84uEjd9Kyagl14CX0a27MA0lBckSlHeMItwPdLMuHLQuSWvZfaWzVNgE
	eXKeCODdv9XU9i8mXQCLABFiSnt0rK22CW7cGGHAtffHBO7GHC+y8EjEwIZZtNufiHb5LosG05y
	B8CVwOgr01jQQ9Lo=
X-Google-Smtp-Source: AGHT+IHwxOcb3R3sB65tyCI7pwggwURoMAYM1HBPUp9ovEhH+GgbxKXoonGNqzAn1beXMKz0JUdsAg==
X-Received: by 2002:a17:903:b4e:b0:242:9bc5:31a0 with SMTP id d9443c01a7336-245ef268f98mr15307175ad.56.1755657934931;
        Tue, 19 Aug 2025 19:45:34 -0700 (PDT)
Received: from anyang ([106.250.177.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed53caacsm10765625ad.159.2025.08.19.19.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 19:45:34 -0700 (PDT)
Date: Wed, 20 Aug 2025 11:45:29 +0900
From: Dongjin Kim <tobetter@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Change ethernet TXD timing delay
 value
Message-ID: <aKU2yYD+N2D1KuHk@anyang>
References: <20250819045018.2094282-1-tobetter@gmail.com>
 <4d25c642-d457-4cb7-8bc1-587edd4f1d75@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d25c642-d457-4cb7-8bc1-587edd4f1d75@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_194535_797111_7E626E1B 
X-CRM114-Status: GOOD (  17.52  )
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

On Tue, Aug 19, 2025 at 06:03:47PM +0200, Andrew Lunn wrote:
> On Tue, Aug 19, 2025 at 01:50:17PM +0900, Dongjin Kim wrote:
> > Very poor network performance is observed on the ODROID-M1 Board
> > (REV 1.0 20220613) when running iperf3 (under 200Mbits/sec), and
> > this problem can be resolved after changing the value of TXD
> > timing to 0x35 from 0x4f.
> 
> How did you decide on 0x35?
> 
> ~/linux/arch/arm64$ grep -hr "tx_delay = " | sort | uniq -c
>       4 	tx_delay = <0x10>;
>       1 	tx_delay = <0x1a>;
>       1 	tx_delay = <0x21>;
>       2 	tx_delay = <0x22>;
>       4 	tx_delay = <0x24>;
>       2 	tx_delay = <0x26>;
>      14 	tx_delay = <0x28>;
>       1 	tx_delay = <0x2a>;
>       6 	tx_delay = <0x30>;
>       1 	tx_delay = <0x3a>;
>       3 	tx_delay = <0x3c>;
>       2 	tx_delay = <0x42>;
>       5 	tx_delay = <0x43>;
>       2 	tx_delay = <0x44>;
>       1 	tx_delay = <0x46>;
>       6 	tx_delay = <0x4f>;
> 
> The numbers are all over the place, but it is clear that 0x28 is the
> most popular for some reason. But since this delay values are magic,
> i've no idea why.
> 
>      Andrew
I do have more numbers in the Rockchip BSP kernel, and 0x35 is from
one of them that shows less retry counts when testing 'iperf3' while
testing with the batch of ODROID-M1. :)

Thanks,
Dongjin Kim.

