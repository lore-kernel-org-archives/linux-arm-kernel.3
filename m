Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FB9FD007C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 22:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFjVWYC4aukpE9k+uYV7EwxrLAHwdFE4Qix6Wa9fAVI=; b=f3MsDdoMzgI+YfdwRgkVwcL3dr
	qlPap1kDosWoAomhDaJ1ETYcIsXhx/sUuxr1sz3ZUwX1gYObykj3qgnqlcaVx9OZHov4r96vV2J/q
	QICllrM6ap6H1cIeFgb6muuoH8iiPYiR9G4eMNNKh9sb548LQeeti74ucBzcGnJfVJKOvlxmb36Ce
	1LXvZttgPMuHpysLwaLXdjFWKH1HU/1gr1A46E4S4zIQMzi6mh8gJFqUPtuAGNTRJtM+J7DLDSs68
	TA+GukiTrNW/NDnK9jHrbPbI28gAH8K/OcuzAq3uQgSGrNRaYTCwKNPnsr4zHiVMVeqjhp7K2KIKB
	nUn/zJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwozj-0000000BwDR-4AWh;
	Sun, 01 Mar 2026 22:10:36 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwozV-0000000BwCu-1u3i
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 22:10:28 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2b4520f6b32so4223200eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 14:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772403020; x=1773007820; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nFjVWYC4aukpE9k+uYV7EwxrLAHwdFE4Qix6Wa9fAVI=;
        b=YpeD63Ipu4mxHmBmhdTtU2ja19LVDSbE8SQORFYlsar0pZ2Ed9QN+n76tEYcxcs+kz
         Lsq1HrXYECrWWHQwzCR/pfXvPdIWrOUJgrNaAjpnZeQ8fEYvKMv35ygRV801N+eiCqyj
         Z2YNib/4b7zlPzwDGXouP2nlqLt+nad6nXG6wlvBc8R6CPRZTJCFdcQlE1ebEnh2AYy0
         oHLNicP/SFDCH5nwNRywQfe4LBgQeO5JJDaOw3GDHrjJepjBmJQEt2iYd8vJAf4qn0ZM
         3OPs+4K6mnOUL3J4AtOUEtS/Cb0g0qQPoYEYDZ53xA3RKz4bBrXHoW30WAQbBn+/kxIB
         +UpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772403020; x=1773007820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFjVWYC4aukpE9k+uYV7EwxrLAHwdFE4Qix6Wa9fAVI=;
        b=VOJy52XNJT+2ixuGFxbh+Mv/K6eWTtuKHuosBtqL1uhenI3gpzLuYT3/3GSI5sAxKd
         0beWLEEMlZNJqUgQkqq2P2uOJRE8nAMjIm+iI7GsJZRODfJHbSFamS0wc1tw7evYU97k
         XXoztjhVXnwq464uamhALilSKasaSXf0WLh7W887W/TykXmTgrj3Iqb6tX9oIASmeCL+
         Nb4Wxpy+x+9LxlWUqW+k1oqnV1VK+4GxdXt1KTZQeiJWu0izIozBad+eYslkepsAlcml
         neSDmGB+0bwpqTm5jugKFRO7Q/PimmWSkWCAWX+iso/k/5n3PcJpncqknl+x+ohAqhgO
         9j1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW75tmbcccwAKXEZZd/g2Yc2Ixu7EFriUN6neRB32pJ0RtuP372ct49YwhTwwlnjulLoGNcEuCOLTrioe0FDZ6C@lists.infradead.org
X-Gm-Message-State: AOJu0YyfNo/+BnYKrp8gSp7lRO2cTQLvw3/2+Opb/Jrtl9c48qTE+R3o
	Yf/tMY/i9twInDNRHt/UgVcSDjFTbU5VpSOMZf5nlFGDNFTcZK4gUwnL
X-Gm-Gg: ATEYQzyVbDedFznEFCPc95Iz5fz4d697kMCxdH5DCFiBonXgVweYGD7uKc+MTRx/ZjE
	yNKysuyuXTtMa0rYtgph2pQaQJef9hGTeAM4c0r/TCVx7rMVk2s0kXBGm4GwbpudVdHqApT5PyN
	e6x22hzgAnHJWacr7sglyl726lTPB4NqEU/4M8d1qlgopuBRDKLK5wUx6yUoA/3mbSgisyyYV71
	rBd/k6I1qIKgoK1FBU4s9zPvE/1Ou3Hv1ho/XZZ7xLAOtjWzO1PQZqDwkZN8yu3niYU9k6rWjRs
	BYe+FYZ9sj9Idteu7tD3spfPjVfGagTWMvVjF5C6Sl5eRJ0bsCEi0h0XKygVJXDR4m5hDmEyKjI
	NcMznbeNKkha5dmy0KVms6B1WMNusEzRC5uDFp87PzOgHXbwy2mwfmgCLMc5Wf7KaFjT+oWyZz2
	Ij9nVvYQGvOHhL8eFq7DKaAYDiVwC9x3hONlLhcF4n92Gh3yyzfo+GaXUBHfUpZi1/
X-Received: by 2002:a05:7300:6c25:b0:2be:e52:a3e2 with SMTP id 5a478bee46e88-2be0e52a574mr617422eec.33.1772403020408;
        Sun, 01 Mar 2026 14:10:20 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:864f:8513:57d0:4064])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be12805b93sm1051546eec.15.2026.03.01.14.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 14:10:19 -0800 (PST)
Date: Sun, 1 Mar 2026 14:10:16 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH 09/10] Input: stmfts - support FTS5
Message-ID: <aaS4cQopqsQoS807@google.com>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-9-22c458b9ac68@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-stmfts5-v1-9-22c458b9ac68@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_141027_172399_57426B86 
X-CRM114-Status: GOOD (  12.41  )
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

Hi David,

On Sun, Mar 01, 2026 at 06:51:23PM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Introduce basic FTS5 support.
> 
> FTS support SLPI and AP mode, introduce switch GPIO to switch between
> those two. Currently we can handle only full power AP mode, so we just
> switch to it.
> 
> Useful for devices like Pixel 3 (blueline).

I see "is_fts5" sprinkled throughout the code. I wonder: can we define
chip-specific operations and call them instead of doing conditional
logic which is hard to expand (if ever needed) to support additional
variants.
> 
> Nitpick: changed GPL v2 to GPL in module license.

Please split in to a separate patch.

Thanks.

-- 
Dmitry

