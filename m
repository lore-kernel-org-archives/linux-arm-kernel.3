Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6F2606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MHXY7TJD;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pwQIZ52d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ndGzkCwTbGT2osVm60AE7H39WPe2NYufaCoY6UTi6Fo=; b=MHXY7TJD23+13k
	fdjvnkYmUM8oTuQENC8pRHUnszJdFmmY3t2ZxIN8hLS1b8/3PrBETFy3Pdmf27lOWCdWomXtyOsJu
	4bZcYJCOisnwGSiT4hlMYUKgu7iz7YWXD/DTCaRF6uFM+TuDbGhZ8HcG0xi9GM0UztTFF9TXX85Wx
	PxPuoAJIaVi4QJ5+Q8XcIeNTUDEopmb8+0mIRue0cSVo8edjkWDH3L0tMKbolCT7+s6L3TCo+10FF
	Yt1krboxkcjCvYH2+aszJ0Odtsa0SbU+2XQhQkuEp7jm7utMaHlfDwGbnb1DPBw2bhE42HG+76hyH
	sj+TrIKOb2Yvp4FRJgfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtd1-00000008HBA-08Il;
	Thu, 05 Nov 2026 09:19:27 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtcy-00000008HAB-0SPY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:19:25 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-71528ede7b1so1211849eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 01:19:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793870361; cv=none;
        d=google.com; s=arc-20260327;
        b=Dafyw18bF2eOy5LRJy0MHmkIznc6DH2CN9OVkbBPMuZu+QR9Pr08rEgStnSZjOS9bp
         HRa+ul/3v0z4x/04NzqXCPM+lYVB/OpqITz0rGQHxjNxHPptozicotWyLWqOy18fze+s
         WpdDhjE9XGY/WcpCk/vKB/wDR2ikYYiHO5XlHAxvGXl4nJTzUDMtzkdT4OHv/WpbHXGR
         MipeeWVxRzIbMV8/a40Zmm/Dkwqlid0Wg8uIbkvJlMdn79+/STuFp7MBiXVirFdMkHwM
         t8r6qKJP2P2ww3+1rv4Frv/OKtM14qwTIIo+ajvWq51ab4EIT6B7d3mO74APu+piV3XC
         q9jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ndGzkCwTbGT2osVm60AE7H39WPe2NYufaCoY6UTi6Fo=;
        fh=gqx0HjdMtaA7ONPAu+lE+eDvm8MwzttvJAcRLScR3aY=;
        b=MVr29mSrXq2o1FeVwDRB8ljBIo6ePr6cMSvk7Ents+V3kW8E85cNUmioG+V+yxOOrO
         dUBnFRJrvpfrj1pigwHmLLvmNk8JihmQ/Tv57v8ECV9EtG6G9ZMAX00Yo5ZR5+YuyCNn
         41r4xoTexaDu95YW7/YoPW6ZQaWlkh0rlEZ+vPq5yI4fgD94+Dm7sZU69+QBNUpkCF17
         1aZ8c5TZXayHewnxNGt2QPZFJrb/6bJ20W8JxW0y1OripmmQD2h3LIkTeVtV0K0kHxGJ
         OUlRy9kP7oQ6K2JOJF06L1JEWVXYfqmvl2lzpKbyHs8Lm+fdUYEMOxYAWbN0T15o7G/k
         ssiA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793870361; x=1794475161; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ndGzkCwTbGT2osVm60AE7H39WPe2NYufaCoY6UTi6Fo=;
        b=pwQIZ52dpsn0/tT8jBld1eCa1ac18zJnTU50RWEBKykSKsQ6jxqnd0EThDGvvYNJ1Q
         v2jHPNFYOU+2dJ/wXjWPpkbKA6u+z0Kfs3WxSy+iZC7K6D5eXhJAXu/QyTn2jj05TQsx
         opMfp+N5+uG1N/BTUHJI2WGapYGyRdsSKCCA1aZi6QN/ChygwT/hEYkUO70RN1gKdmtS
         ZS9ohDqKr7f/BQheTht7SzYyTuPx1zl8OOfG3w7U1ZQN4FHP2wM+2AJTTsFFD3lsh7uO
         vjCKCqRn3H5RDI6fJl/jiiYjCQQFg8qjNDPM+ITtOXRCo/oHxhPab2nxrax5+ShzGo5T
         Kp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870361; x=1794475161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndGzkCwTbGT2osVm60AE7H39WPe2NYufaCoY6UTi6Fo=;
        b=K6DCGQbmS92lg4CvJiyWbSU8tZBhPd4rF0Zg6mKSt5/1AW+nt+sH8AkohN5K0uMHZG
         WJRLfi6ce9rMBWXo91/X4NAnxZVCvZvgSJg0Qn3p/dzZGp3UAUERy99ANQcW0NmbwPQh
         OnOYK/nUPPj3RIfbk8tGuJc+XYzVlBHw24f5WsFUy0sRTjWKp0JX05OLCdZMu/xEKYWg
         efrcpN0T3z29FYZ0ospssk0aJvnXn4mpMcj9qDUOA6y6T5ErK3lbwiGe0+w40iOyBVKp
         JspQS4B0K+Y2Gq7hlhXrsSqBXszw7YSaDe+37eGhsX77+frQzPYrcCe6CbW0wkncdmGF
         dV5w==
X-Forwarded-Encrypted: i=1; AKwUvBybk6wN0FXWKENa0rKyaYjbEiCxGprJcG3pijxYXgQSBxZ5DX7pf/2wiuJZj8uiQuymOPBJHwgyeRTqWMFVAz1A@lists.infradead.org
X-Gm-Message-State: APuU4Z9GVdVEWvtVni80a4zNqUgXdDieMc3h1WWAqrvg0290Nr5ZBJ1Z
	nr7CiIxwPuKQpk9rVI4+4hffDIQQc85124yLqxeRhty21TkHwrRW2zzYPA+Bzi2fH+7LpJ+KklZ
	unieZhY1FPrsJ1ES1WL+vO3eRuQywOp0=
X-Gm-Gg: AYBFou3sIg3O82dXd1quwsurxW4FLBR4GDF8h2ylYnO84Dyss6Tu5FncYuFsUQ1cBGE
	KZ4zy49VOZfDT9/pG1E/EzH9OGKq+utrcEo71//YzUYNNY8jSJd9ZIrkn+NX/WNamDRBDqO63Pj
	u7FCY9XwS0b4UPdMPW9TgtvRrpUU+ucXV/V3S1RGoWeBVdFHjDCzSA+/NzTJd3tltEI4vsjhJtg
	HkZbRr2PgIsoVt0pdnFfP2KSYrMJ/FgD+K6acCyc6UyoeW4qTJvYLZPKgiV7bbsWdv8jW8q7JIX
	D0P9ONgGlAgu5f7wFQk/eB/ux+bz8owVSR6aYy0CgkApLPYDrbjFpm7+UB6i0MQkgBhj/3qBYe/
	Wct5G9K1OOWh/3M94dKtQ4UM3JPDLnnR83FdNmg==
X-Received: by 2002:a05:6808:4f61:b0:55c:836:597e with SMTP id
 5614622812f47-5640dd5ca51mr14606352b6e.31.1793870361392; Thu, 05 Nov 2026
 01:19:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260930111813.52396-1-chou.cosmo@gmail.com>
In-Reply-To: <20260930111813.52396-1-chou.cosmo@gmail.com>
From: Cosmo Chou <chou.cosmo@gmail.com>
Date: Thu, 5 Nov 2026 17:18:45 +0800
X-Gm-Features: AclHuK81XJ96pBCTYU7-hDy4yf8gIUQ_g9ciWuO0heyn1wGR422e790m2Wvg4ZU
Message-ID: <CAOeEDyuRboYqBUOtLke=X0F66_A8NCHanc2iXt91duLRFGSU9A@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ARM: dts: aspeed: bletchley: Cleanups and second
 source devices
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	cosmo.chou@quantatw.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_011924_157627_3B0C48E8 
X-CRM114-Status: GOOD (  12.01  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

Gentle ping on this v3 series.

Thanks,
Cosmo

On Wed, Sep 30, 2026 at 7:19=E2=80=AFPM Cosmo Chou <chou.cosmo@gmail.com> w=
rote:
>
> This series resolves dt-check-style warnings, sorts I2C nodes,
> and adds second-source RTC/LED support for the Bletchley.
>
> Changes in v3:
> - memory@80000000: keep "device_type" first, per dts-coding-style.rst.
> - Link to v2: https://lore.kernel.org/all/20260729114312.3947300-1-chou.c=
osmo@gmail.com/
>
> Changes in v2:
> - Added patches to sort I2C nodes and fix DTS coding style issues.
> - Carried over the second-source RTC and LED patches from v1.
> - Link to v1: https://lore.kernel.org/all/20260714120816.1504058-1-chou.c=
osmo@gmail.com/
>
> Cosmo Chou (4):
>   ARM: dts: aspeed: bletchley: Sort i2c device nodes by address
>   ARM: dts: aspeed: bletchley: Fix style warnings
>   ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
>   ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
>
>  .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 1315 +++++++++++------
>  1 file changed, 902 insertions(+), 413 deletions(-)
>
> --
> 2.43.0
>

