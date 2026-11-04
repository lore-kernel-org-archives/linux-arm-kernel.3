Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4370E606E83B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 22:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=na8vB1bF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=SyA6t0X5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uPpZHIHN2f+krnoJTSXhizzaZXUBHGCxVWnErBLk0sw=; b=na8vB1bFvXtrcGcFuKpH+uD+YZ
	aFtXdcUtQl4MOZAqhmOqeoCeNRATBoAyTV6bYHpdJJXxmfVVVB1kUyMrSlC2MSm6b5tJCBC20M6Us
	XE6d71lDPlwQOtnZUTKLY64/fcJmDwszah6heYMD+2ySaFAD9bLbFZWFJ2opz78I6w6/Ko2NCA14F
	i7Uyj0a3TsANi4lB3KEK0wjrBn7bhN1bd9KjlDXRdg4MHt/QWqj85Dw8xbaslRPNGgJkFskS4+gy7
	AirG/Xh3PzK1hA56/Q57RP01lY5041Er5WR1/I61lkFpxqsJgiqoJsNZ51IewZetGDuohz5+7AGEb
	2gw2bwpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOj9L-000000077uR-0AYL;
	Wed, 04 Nov 2026 22:08:07 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOj9I-000000077sQ-12Kq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 22:08:06 +0000
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id OdPjxjp6HOOJnOj9HxUTe9; Wed, 04 Nov 2026 22:08:03 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Oj9FxhEApKD1BOj9FxgJHn; Wed, 04 Nov 2026 22:08:01 +0000
X-Authority-Analysis: v=2.4 cv=N6MpF39B c=1 sm=1 tr=0 ts=6aebacc1
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=mpaa-ttXAAAA:8
 a=AhJusznchYkEs9MMiQMA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uPpZHIHN2f+krnoJTSXhizzaZXUBHGCxVWnErBLk0sw=; b=SyA6t0X5HCcBfATZNI8Kbb4ksm
	hTB7osa3MOtNNirjIdy8uJ8HAWGaphLEybiIZNPeTBj+JeVI80v8EElmkTd4hWBuPa/Z3+pl5092+
	g1k8ogbs00esl5aa6vfujqZm05BPnNOXAYmYbS6FjwVyliDV9z2cyOaHG4eoufGv3F7acBqjphECZ
	a83clvz33UqYtmcmVN1kGQ5M1xWyCr2hbVp50kXGgewihE3mWC+1JybQabLER4T44tNtuEGUblraT
	lHRp8qKk/AeTvLQK/pMznIjGWDG3GjfQaHKI0mbyQQ+eTJPQwxlS6gFmQctKCwhoIFmA/PrMwIFA4
	RISQ6J5g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:36806 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOj9E-00000000ul0-2R7W;
	Thu, 05 Nov 2026 03:38:00 +0530
Date: Wed, 4 Nov 2026 14:07:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Zexin Wang <ot_zexin.wang@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	light.chen@mediatek.com, Fred-WY.Chen@mediatek.com,
	Yt.Hsieh@mediatek.com, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] watchdog: sbsa_gwdt: Limit the MediaTek WS0 race
 workaround to revision 0
Message-ID: <055e6366-83db-435d-af3f-4168a822a870@roeck-us.net>
References: <20261104083714.3026535-1-ot_zexin.wang@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104083714.3026535-1-ot_zexin.wang@mediatek.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xOj9E-00000000ul0-2R7W
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:36806
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfO1H7OWjai2k/Af46XHASLPosZ5yWbB4GtNGYUtKEbbzwFutax80auebrwjS8Ymg4lWzVFZT67mzJiPPblTJ4tfboVXf8a6ww4Shl6hpMAmuJu1xxkUL
 vuqheYcB6AxXGjxBRS9P3XNn9Juh2atPMbrDlywpxmVAwBHVWbhj+0hCoMCEAHGJh810W2vya2bGAW4F/clkHtFyXzqJDbmdgtugQTpI18OwDAr0N3vXxG2b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_140805_289759_B6C03866 
X-CRM114-Status: UNSURE (   6.36  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 04:37:02PM +0800, Zexin Wang wrote:
> The WS0 race workaround is currently enabled for all MediaTek SBSA
> Generic Watchdog revisions in single-stage mode. However, only
> revision 0 is affected by the race condition.
> 
> Read the revision field from W_IIDR and enable the workaround only for
> MediaTek watchdogs with revision 0 in single-stage mode. This avoids
> unnecessarily restricting the minimum timeout and adjusting the
> keepalive interval on unaffected revisions.
> 
> Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>

Applied.

Thanks,
Guenter

