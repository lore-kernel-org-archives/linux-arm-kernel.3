Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A8E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 04:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SXDDf5cQ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K/sHrGmF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N9wqBNwFeUJDyujtnIyKOyjh4O7kEuJC5I05KW0Mx10=; b=SXDDf5cQLQ8P5tRIJY4GJMhcJb
	srYYOGXEE+IZw5EqfTerOovPvjLUicT9hzlI6hCttI4493dhshdNM3CbhAzjWn7wdJ8aIVRMPxcpV
	mzG4BE3P+R+O3nWYxUscGC+BheKyXuXTh8+tH65Pw5sDvtS/BXGnVNjhinINwJbhMQFt3ZL5YOORL
	EFojS/KoLUw4c1N02uw98r0a8wEcg1KIOwZgovpP3Okmt+5wH2VxFAvsNXkDb3DvPEvXa6ty44zU4
	pflWe2uz0/mM0X/esQgGni56+NIIZGP3YdmJPPlh0lmS/GrAYbfV2qkE2bRnX+EIpPR6qtbB/Vg9w
	tuYOv8eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLCSG-00000001hkp-3Oob;
	Mon, 26 Oct 2026 04:37:04 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLCSE-00000001hjn-0ViS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 04:37:03 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6aff2e5b322so412510a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 21:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792989420; cv=none;
        d=google.com; s=arc-20260327;
        b=IfTlEmcS7hrkNM0eqQ94Nzi9wbDtL6dkzSVxyoSMvyA1Ed2VVn6d4AOuiGURz3i5Uz
         8qLtFrxXbNoxNUxuswiHlZRcCjkRdD/bwZoCqdud2iV8PnsEPB4uFqEO5dat2dbG8sXv
         ST6pvt/YYs0vJfdub4QT5HGAOpTAuNfbcyNlruGhijpVn1SO34GEKDXzHPxGWYexQSJA
         PQ3YP31Ez1EfLVYXsda0A/gl0xE7OTX00UMUynY0lsaRZ+ALcRWoOX3Uv4NnB71ypqWe
         sfS90GmUbJWp8g0todjhiaZVN8MQv8m8LSK5KZKZo+RL5vhrFzGg8/jEZh1Z0gOSnxLa
         JCig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N9wqBNwFeUJDyujtnIyKOyjh4O7kEuJC5I05KW0Mx10=;
        fh=h6inilIYe0JNZEtv2vqID/0yzi4wxXy8KwOoyeXUUEU=;
        b=exTrcF7o0mnUsxGKCgGeEfrelUGsAiFpJ97GduHxphHUFiZ5MImQPcRx3sg23c/fm4
         ynWNoOXHlf1D2Oa0cLRL/7iJBuEXsGcFs03A65EtbazCcZWksGVBakE00v8s4zd+9gBw
         Ja1vplGE/YkD4WPmm1ql4SDQZ68+FNAjYQN2mTlGQtVAtpPy0vzT0lc5dnuSFMncwbw8
         QxbbXbadH9pG9mpTrGijj6vIfESa7ztDHT6fHLR85GOqHdbVb8coy/Spfp083F8XfROa
         LvQoIQJTnwKk5YIcE7syIhAzar3HpkOQqAcOak03yS57dxVVbs42QTx9sA3cR3vJzq90
         YLmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792989420; x=1793594220; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9wqBNwFeUJDyujtnIyKOyjh4O7kEuJC5I05KW0Mx10=;
        b=K/sHrGmFl55Bh3VR6T3+j5V7c6A9Rit4kq7dRsppLOC+0MtvGa8YOqgiGwtGhs8pq1
         hp6bK25VGQFcjaQbGbr25U9nTQK80wxi1lSza0MeGU0EPDWUWTf5lA0MVtr1tnqGmASP
         51GOoSAdPJwDsXnjYZKzLwhoj58V+VASxeBLzQym0SpkFfHAQhqgH6bcwpbkDyXoGIq3
         4jj/3qdqeGEZkXjswhaZIHgkiA9OddOPtbPNSlOBI4tas+kMysnLpiWyV6tuBIexmJ6o
         gyIxepWIQV10QkuL5r19Xzy2p/DDgU4GZlCK0BJ7s/DvEkVX7u1Z1MILRTOrfoPPnGjU
         qwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792989420; x=1793594220;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N9wqBNwFeUJDyujtnIyKOyjh4O7kEuJC5I05KW0Mx10=;
        b=vD83WsxDXU2j0dkz7hMh2lNWmSjVVQma63nIi0mJNQzq8QCug4petsrBtZ2LPEj4PV
         okRe16pMAYie14IIuoy5y2gdEVluloF0TJUilCBw10d7rXnqfBZlpVFjPLpmqsB/fsWl
         tq/LKQtHJXTvy9405YksLHKPyhxw2CBIYNjvg9LJrJeLisXozrz6qq3FB3VQjEwW9UTy
         9wF70HrE1xG3Gu7PZBtP+vFHTSaW/aa8eknOc/jMoyto51dgX8RiubSFN9OZ2RWXb422
         CM41P/c5Ypn7yOXSZaYj5VEHp2NOdSDRjruQmtiy1u/YvMYwY1ccglD7gf/pF8z5VhsQ
         3Nbg==
X-Forwarded-Encrypted: i=1; AKwUvByKaBujR4IngvUA9gWzJ5jOJCuXdluxH6jx6RCuodoP+44O5zkmel6WkVFDab+jJxhFJBjQ/MVtdywSpWQiCya+@lists.infradead.org
X-Gm-Message-State: AFq9FYKZ6wV20A0wMW5NO4MGyKl5jiMXgVQ3t+J5CAsUUBdcDV4rC8n+
	RLFs2aNBdGa+O4DBKbH+TSECQLsaAtIRrq5CMZ3/jxHRf+cNPPrK/Kh+cATIy4boULjbZ4eTSOf
	vxa3AKENjIP1aY8jKjk/xVviAsdlCf9w=
X-Gm-Gg: AYBFou3G8nTEn+8wWB82fh78UXrEbqSDdu2O6rQ0BIOyGhg+sdVztZ24IER7w4zTD0Y
	+zrUVxGjJKfQIWZLXp4nwK/5K0jDRneJhoqIToHBi9H8VHxtBPxKD02KIjnMFzbl35ZLq62R6qr
	KldVkXlUhWnW9vfPMWuL42yK2Vd34I4i8kbexO0DekTvg4TEpgeT3GbJbeRbPoYOJybzlXSGUGO
	RQidQcJzqHq0o9XYEeg5emJr+kwKF0WQlblEUbzfz8lAHWoJJLkDSVGhw1W8nf68QeNwXxbbWDO
	SZThIZ4rbjPHXB1fig9iyBJ3LluZxe4C7W6cCiNj0R2+W7f3ecRq1Rn9GzywrH5uihisXbGf8nO
	13axxRH4z4mORs7bm2rb734SHsTKVD2XcEWK2
X-Received: by 2002:a17:906:100a:20b0:c25:3ec4:9e43 with SMTP id
 a640c23a62f3a-c46bd90669emr681750866b.0.1792989419265; Sun, 25 Oct 2026
 21:36:59 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-3-e63b49eabe2d@gmail.com> <f9b60989-e58b-4ac1-81ca-f0d37d4143b4@linaro.org>
In-Reply-To: <f9b60989-e58b-4ac1-81ca-f0d37d4143b4@linaro.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Mon, 26 Oct 2026 12:38:40 +0800
X-Gm-Features: AclHuK8vZ0KWZhabRgBdGgKek8QAVY3LLhkkHh4HIG41oJjGA-gl75AkOIcoHmw
Message-ID: <CAPwA33LZRPs4O7ihinyorahAQiWY69C1pxWnhVE-gTUA556MYQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] phy: rockchip-samsung-dcphy: Move block-level
 setup to runtime resume
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_213702_187381_823DDA71 
X-CRM114-Status: GOOD (  12.58  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bryan,

Sorry, I missed this one.

> Would you not be better off scheduling a work job when you know both
> blocks are out of suspend ?
>
> That way you always have a known sequence out of reset ?

The two PHYs share the BIAS block, but each can be used on its own.
For example, while DSI is running, CSI can start and stop streaming at
any time, so we cannot know when, or whether, both will be in use.

So the block-level setup is done in runtime resume. The runtime PM usage
count makes it run only when the first user comes up, and a second PHY
coming up does not reset the one that is already running. And in this way,
I don't need to maintain a refcount in the driver.

The order is also fixed: the phy core resumes the device before
calling init or power_on of either PHY, so the block-level setup always
runs before any per-PHY setup.

Best regards,
Jason

