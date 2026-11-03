Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA997606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=drsc/75s;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RisrCIuh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2FKTkbjMq551x1zBA9LAkdden4yep9Ltl82qRnf+m2o=; b=drsc/75sVo0jIa
	++oI+dSXa+JlwprRAN2+cYSzxg/DSe9dqHbbGCHZkoyySSiSsfg10hCjiE6RqREcHj9nERaykKPPO
	Wqzn1Xfl63AYacA19XK5M/1UpSrG7dz5ELeSHDMtJvSQ8zkFaEpDGzXeHJYVNCX8cHw/d5OYdERcF
	7WafmlNhfZD5fy7mm0w0iUzLjAAwkJfqi23hbJgRKLnQ3Cql3ZoqAW9CU0zOVpyW8zFkB9PuWC8N5
	ajeXqgcmbfHOQ+4H49qErHDDXKLWsrQgDPIKc2dJrj6ZQv5O+ycva3EEH6T4mXUuihA4NLtA5hUjW
	Z+FUH7E5ivgIFoC+LBVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDJ-00000001ptn-0eaO;
	Tue, 03 Nov 2026 09:53:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDF-00000001psY-3KUr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:53:55 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so6226275e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 01:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699632; x=1794304432; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2FKTkbjMq551x1zBA9LAkdden4yep9Ltl82qRnf+m2o=;
        b=RisrCIuhOSEsCVZyBRoG7wzdalFtZHR9+J1ftklL0DjwimhFiFig190nwzPVtWDajM
         FGX7pVHz48XelEXyy5pRnDllBu4aneY/1aXz8zsr2laCJVJlTvYCtjs++OHuQY0lbNLb
         9RvL5oIMbDsn6ijHV2kVNK5vXrT1bpVVRk0PVn/eAhgez1IuyfJwKMatIzvTH4GtOiQU
         rL5loEZCADrbVry6yyVhE00j03hqu8pbEAwR/eJtfbHWwiwxeTBSDnK3PGnq0uy6pDK/
         hhMAi6sznz0vngNjm0bNFbgmTVszrPpvxO6dqBh9IC+g7pDher5wFotIiy2Al51Fg12u
         nw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699632; x=1794304432;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2FKTkbjMq551x1zBA9LAkdden4yep9Ltl82qRnf+m2o=;
        b=0gxY5VxnJu6J1F2Nge5Per2NXOaxefEs6AgwTvIpFsULGOtwmAvyIWOIDtLSE5Olz4
         96ITMBj5YMLzPA6BFTOBDO8gA5EhjtK05NXTr6IbOg6jBoO5YY6m+4jhb88YD4ecC3J5
         Y6cHfdjKdF7ScwUbUXFkB/A6bKQjaI12dNjUxQ+AnQAaGW3/zgL4iWqQNt2BJM1Pj7FR
         SKl4dWw20f0RWvMn3zve0om8C4kZ9bEseuOcNAwvldvBWbdIaou8oFlllQtiBEwO1lsU
         yZYoDbMR+i3Ihz6m5yBUqA/7Gir1eRzdLuQGJgOiT0lMNRe6Gi7ymd28maZp00BhJDLh
         70iA==
X-Gm-Message-State: APuU4Z/OT+P6onbDOYGUp/M6+lNjfkq6raxeqUSVXhYbCC+T095bWbe8
	FNjyCcLbF4M2/KONQyaa0N08RWZ5dmcDR+Kp/4fEaxoN0LMvXqU++OM/k82mcbl/7/xZUyKNFXT
	NJkDNkJs=
X-Gm-Gg: AYBFou2qGk/BUpAB3YauIun1T8Hvlac8n/pyjoQppzHjQjcu91wpok7R1Rg45LbC+Wn
	xhcLqfFzI4pyYPNc03sS/quG35wiejDqpwbnX+jWjN7CBwcSIRYp65QnVu2Un61z7WIIfiqR4cj
	SOW0IB52/d2hS0DEplch3JLk/2pnmmIQg4XmYgwBoPZZL2sl5uv6HTkoKSyQZ8AWwp+i7ny3lDn
	xJ1Og0SpkP2pxUmeT5w2FUcSXdY7gl6DK+Igg5KenQ7xO5pvYuVacLnKa9EQrdKAJOVj6hPNFGB
	so4RgC3/4k4vttqd2MSKqbOnLDcsviLI/k054TvAsVKWri8USZE+1DxSpstaJqycW7OBq88njnY
	w8XueZoXBcNLWmlEotf+vFLRNgHsJPqRCcPig5sZjuPriMZ3pn96jjWcngmA/SRL5ofcqUfh5VV
	dfG39qBf07PpUGDNfMLifRZnAo1vRcG1j97oCeMihlgLBOk2ulZCCtpKkk1X4bha1j7FEmAOznr
	yrDepSrPWVRQP8bmPSBhz2/2sqA/bTugbdGkXO4qFoWbzhxTDU93yqgiLJQ+RMbaNbqeXXCCTzG
	7MEHOl9CwYcFOKhQes11vYjr7hfDJ970YWEaHthHkj1HsAvBohteJijq+TbJK6CEDUYrcird
X-Received: by 2002:a05:600c:63c3:b0:4a1:8dd1:305a with SMTP id 5b1f17b1804b1-4aa842d5105mr293968785e9.0.1793699631508;
        Tue, 03 Nov 2026 01:53:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b79059sm24713976f8f.30.2026.11.03.01.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:53:51 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261027-fix_axg-v1-1-741388f1e851@amlogic.com>
References: <20261027-fix_axg-v1-1-741388f1e851@amlogic.com>
Subject: Re: [PATCH] soc: amlogic: clk-measure: Fix AXG HIFI PLL name
Message-Id: <179369963090.2329777.13837819298498627747.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:53:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_015353_870403_9C12DF76 
X-CRM114-Status: GOOD (  11.69  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Tue, 27 Oct 2026 16:43:39 +0800, Jian Hu wrote:
> AXG does not have a GP1 PLL. Clock measurement ID 5 corresponds
> to the HIFI PLL, but it is incorrectly named "gp1_pll".
> 
> Rename it to "hifi_pll" to match the actual hardware.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/fixes)

[1/1] soc: amlogic: clk-measure: Fix AXG HIFI PLL name
      https://git.kernel.org/amlogic/c/81e66c8204c98b2c71798f241cd43f694c5cfb3f

These changes has been applied on the intermediate git tree [1].

The v7.4/fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


