Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA267606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 01:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PQtTYDWp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H0QcrRIY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezGP1Yonno3ZtROnLi8FLhe0PdCDx+ACf/Q9hTx5uuM=; b=PQtTYDWp4t6uI67+dd20QdZ4Nr
	HB+F6njkwZjXfIwBWkPU0EumbqVVttdniVvd99wvB8aQex9/V8I05f/PU5EpZjdsKJNg1nVhogTfQ
	NIKsYIlZRUxQZncPGF5Ki3gre37qx2hZT35RPvaN9WxspYmE1xwy5N5tnHICJTA8ZEkY/NOVEEOT4
	A9vq0NQPVTx0VNO1TBOES6WN1czZsc9aZ1IXUkXO0hyvVd4VrfGMTz3jBLX4gLQnXV3syrmd64w7r
	euQyAYznK/BN4oXovK3EWwWGRB0M7w7l46QFZElav0yGa0akO/Zr0S1J/FGOTvQyL+mFLxNGqOfSc
	B/PUw3yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyxr-00000008eai-0jmz;
	Tue, 20 Oct 2026 01:48:31 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyxo-00000008eZR-0Tnx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 01:48:29 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1517bda04a0so2271399c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 18:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460907; x=1793065707; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ezGP1Yonno3ZtROnLi8FLhe0PdCDx+ACf/Q9hTx5uuM=;
        b=H0QcrRIYuQwghjBhk+C1IjDU9k/GmD3acxRiE0dF2aAHa5rmalvNnVnvV5neHNAnju
         OpgVyCd9LLgl1DtU2c+Z1ilXn9UF3TQ2/NcAQnwSj+eDG7iYjQSdcDTv5pDI315yPvU3
         D0BqIJ42f/RIk58NOcmdFHx25WlZEh+UsvnYoB7ZQ6AhflxfCwVYHrEt9pH48Iv85Bz0
         Jhie+yzRc09OZ1NG/KjKnVmpvn8UWP5EGxk7bnDkcpm1ygElogrB25pWWS7VdFWoAwbf
         wKAxZkEEGzNX6/qsKo7id2HjkMD9Q8KjbZBOKwL5y+Y1HxcOiViXAY6XCisVB8DBp6v1
         yz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460907; x=1793065707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezGP1Yonno3ZtROnLi8FLhe0PdCDx+ACf/Q9hTx5uuM=;
        b=RyuIT+nPOLfk0YwjFsKEgsXYh+PmI+hbzxTgmGlyzZvUH9Dq6brWVd+ayHuSkQibvt
         oI2V7zFRlPTPBDZk86nQUPFF+YT5dJXGbqHqIZXdzBPZ8fZOHk5s4WfIq2nBkVNW/n/U
         gsyypzb+4u5Atlud2GnTOnT2pWDkOFdZioQNIGmLlm/cmtVvFelqSpOrMSfbAn3p9Zyb
         ordlW0LpIDaZoJ/NfNEF8tNcnXj3b7lTG8lAbBYYZAKd68KNJ/tuuIkk6+JipJ4UN4ip
         G2GgXoy4yUDAzY+lPMgd3uEGDFb5hf+A83Hd0qSthdoljEpdl/cUHZCTz+S+1SMUT0UF
         Rf5g==
X-Forwarded-Encrypted: i=1; AKwUvBzy4HatTbeNwUY4nnPw4dC4g2uBUsjRpR7VRIw59+vYyDVXZ1rIHnHQLy9AQ7uKOuKPuNt7nhAgax97dEFn3miY@lists.infradead.org
X-Gm-Message-State: AFq9FYIaE90M7ZRKhvT533WUFv5TCrIbAH729nWwsG0nN8NCkXWO/cSJ
	CEDVW3xiw97JarQkhMI83saoexpRiWI2oio/84QA37EaHPX3MgMWjxl/
X-Gm-Gg: AYBFou2K92GgY9z5tbJwfjmXunBBiI2apLKmnhfP8OXTzW7Jowi2UYag81BcdEgQtrZ
	GuyorUvGWAMPFV0a2VL+cMiJsSx9t3T2dsckOicbNAH913voZpkkpVWj18ZT2JLNJWNptFBzSju
	vxrxqh7ofOm5fD7PsF+SJey7hC9UYKC7zlt+t0np3bEhroRW7Fggbcb2bUeRE1HAW2aWLv/Iuxd
	BXunu4YHDTZWfWpGa45zYoRx9Xg78bxo7WrHRHjY+9JWLzhzqvj/ZsuKK8IQU9U8ib6wNs74Al/
	J0M3txN3TMOXCrX2rhPg6qOkZyyuDBOon2YBsBVd6MZWaWA8q2RCBxipkIETv7vgwJ/1HtN8pJk
	VUAERDUH0z9pHUuoT/Ve0lNcvMqdvt1/KgMblB9jVuFPMqOZZ2hYuGgx2r6I5ziJbPJnHPYrys5
	1LW5RYMRb0LuZqyBzyzyRoQsBdEZqFP9BQ4UIH6D+0yH3jP9PqZT/vJ82MsUGfCp0LtZtW5OXrR
	hO4yfM/NwGR
X-Received: by 2002:a05:7023:c087:b0:156:3684:96d4 with SMTP id a92af1059eb24-1851238b5e7mr13733617c88.25.1792460907214;
        Mon, 19 Oct 2026 18:48:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm28699903c88.14.2026.10.19.18.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:48:26 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:48:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/3] watchdog: mediatek: add MT7629 reset controller
 support
Message-ID: <4606c758-16ca-4fca-9a0c-babf15643b49@roeck-us.net>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
 <20260926-b4-mt7629-toprgu-v1-2-c124bf9ac273@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-2-c124bf9ac273@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_184828_147355_49283294 
X-CRM114-Status: GOOD (  10.97  )
X-Spam-Score: -1.5 (-)
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Sep 26, 2026 at 07:14:00PM +0800, Chuanhong Guo wrote:
> MT7629 currently matches the MT6589 fallback, which exposes reset IDs
> 0 through 11. The MT7629 CONN_MCU reset is at bit 12 of the SWSYSRST
> register and cannot be requested through this fallback.
> 
> Add MT7629 match data with 13 reset IDs to cover the CONN_MCU reset.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Applied.

Thanks,
Guenter

