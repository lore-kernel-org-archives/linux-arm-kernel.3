Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B6D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 14:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ucnQcUIt;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Id+0ZpeV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=; b=ucnQcUItbwl3O9
	w9zS/4yRyzbhMVBTYwiYc8LwsRAAIbdGyMXHTC70A9/E3M3fqtFoJkqXfhbAS3iDJZl3ANLg8NLd2
	QohD2Q4K39s3h9QxLqIOWYL/YMY5Ev1iW68cj0DNkCKrZEy7Xrp732wg6E2M+gb9wqUNAZGgD4E+y
	k8ry+Cw6GlFG3qTvQ/zxzleUQTjrHahmJBusTzfvtseiMVmeRe8xclMktXWPvjh2gbFVZ2CcKrHAh
	dWTekwvY8jE6XOiIrgWwM4++8BxbhVBn7htFb4Oox/2F9yLzQYKd9DdPqGwqoIy6CL2jFN25O3NmB
	iAj5mADhlCf2pLSvWqDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRKH-00000009XyY-0WIE;
	Thu, 29 Oct 2026 14:41:57 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRKC-00000009Xxf-3fRd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 14:41:54 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c37b612635bso315781266b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 07:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284910; cv=none;
        d=google.com; s=arc-20260327;
        b=iUKJMb06BnDk4oVFYID9GHHAEkqxEpWX8xsK70c8ObuxsWW26JLzMu8czVgjZ0spes
         kmclOdC2EGCz9Infr09moaDEWT777hSLdFYhzLi6/siMG1ZGJnFsrvuYz7sNewUnvvZg
         kaIOsNcrhC3ptj/svrVkc1o1jCIPYvYiuNEXdfnoaYu8KlWxCKPzB9arpmLrpvxp2drt
         dwf2sZB6tnyOiyZApZiYxbXUGsGVEpRxLLW2ItjHms3/eERu75o4tGSiYUrEiRVHc1Vl
         1d6GOuHlpbAo9eKej2WjmHPtXeql8TsRIaqd9oG+n/cydqUrztfxA6lqVuOLJHye1Isa
         l1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
        fh=0djkDANYZ5DLH8dRNDrQYBnuRWvtnxLqVvyC8m/hYlQ=;
        b=pMGEO3TL3rsoqVt/OOACqq/zDkJ6jkLEw+8SAw44G+2HgT5+zenwfR3O3csqZXlO6F
         limN+0bDRt6OtYTK+dudQl9GjZgsjD5lhF5R5i4jgDLseF4aIuCGtj+GG971FbZBvDhX
         czcUkzhG96bVq2W+Z4PnsXZpyAdDiPHNoj4vVmupqlNV2XrvJ0/94/YFTemWRYebNL6g
         ORwvVGoKKhhz2sstCvrK5jP3LSU2t3nyMgU2WOFxz37bEADpfbhkXHKbuWGRL1NCSNin
         PVVx8VuXlUoqAPcwXjpwJR6IoSE57uScBMoVpVNU7ddR2Y6GFzquDrNMUs/VjcmQg2BW
         lOEQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284910; x=1793889710; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
        b=Id+0ZpeVOuwPS1LAY4C8ATFwidwviNfF2L+uFnlf7MHxTXO7iFQEHD9G9xiKaaLntw
         6fzsluIOHlyR3MXH8YWJeadvsO23yKqB/vZY5DwUDcpWH367jzjHg7pQgQPVcS88FD61
         Mm1ONynfTX/IC4gv5v26zVDlr4o7rOA7r+FN1yVyIMNvXIBKNSFjweNlNAKoPA8LTp/Z
         0Q2C3I5WUxiMxqNRA9NYVPHbRdD4x+CD5LjSw1Cc0jwxKNC+M7WlJGvsq/VTUdNQR6yO
         fwuiXrMnpQDhnIGTipkDLdvp08uYp6ljAJ/atTgnCI2eT4vam5KVXBCclV3AOPIb2VVw
         uHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284910; x=1793889710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
        b=D26UrcQhpj+zU9QG2lF1nlnRlujf99681rSrbMRUP39LBYmB8VPZiS+n3DMR+azJVF
         cBtBwZOxjYgshXbLEC14ScFumMjk6nK4qysYl4W0BT6Lt7qOqDfTJWiiek8nuwQuSIit
         TuSQSCO1vmhTUFukCARmNiwIuX99FL5H5BRTYyERLYtZmeiGAd8+wAYlREWBNJq+AJb3
         qbc+QozSSNurJPEAjOLKYzu0R0lxhqtALNW/bVzVSsLN8yERO/igI5NoBw+/YV4/LUlJ
         bHGdOmQf9CUoR8U46LLWE1IWhjFM5+ImBgANzJSNKSpkknmtUVj+vOuuZiyMEg5dFFe9
         gtvg==
X-Forwarded-Encrypted: i=1; AKwUvByKzmabIeMxCzNq3BZu1p0ufVcYhtC1Eh3YGbCQzMlB9itIqnX3mcB7KkxjQlQgQljynn96mcN7wNJa7XfRqcca@lists.infradead.org
X-Gm-Message-State: AFq9FYJYbkW281KLzHH+NRE2xY8Gj+TDszdNt24gVAkO6TiaaFBIG1k/
	uksjSmCD+6POT8mWk1oBdtnUW/foo7oki6MObGyyPwM0iPG5i+8IXVhdbj//7buOackQ3vakA45
	uddEoUxNl7mb3EMP4l/vaQNN/FY7lAiI=
X-Gm-Gg: AYBFou2X3sfBhv76lHRgpGIDVfjYS3ZF5wTLWxcQtk+XM82uYdZPKpGncxXCU8YqH5p
	pUMfBLa4qs0Flgl2W/CuXginCR+YhyNHKd3T5pisA4ZLq9s8wbLQhBpTf/c7yvTKyjjCZNUBGYg
	i6dGKGItAgr6OHa+LIka+9+cN/aWWRTz0lIpHMBxCf8kk5v5DGbEi5iODSBWG/roDLzuk30/apd
	UjTxPCvxMobR2zbbztGz9/XIWRWI3HB3cBioYRdkwO+QgWODTy2J/bV7HRrw2R03itONyBWYIII
	ac5m5ITGKG9n4kBMzlMdUVsZI+6pbDtIB892i93Ux1yhh8YFZWMbchVfn60Py45JYwVq0VQRHHn
	odnJA0AR10AZO+eGvrT2zA1E6jtqzVjpadQ8OHG7AqMKwyXKh/CTVAyIklwTt2VVgcGl957lusO
	903Mrn55iEDx1f2aCrmtW3J6QBww1hUN9H66TRCdZ+b6JJmpRA5bQ=
X-Received: by 2002:a17:907:a88e:b0:c46:6a50:40b7 with SMTP id
 a640c23a62f3a-c49bdf25ef1mr512176766b.10.1793284909657; Thu, 29 Oct 2026
 07:41:49 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com> <20261029-gpio-vf610-fixes-v1-6-45b484b4c434@nxp.com>
In-Reply-To: <20261029-gpio-vf610-fixes-v1-6-45b484b4c434@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 29 Oct 2026 16:45:14 +0200
X-Gm-Features: AclHuK8IDt-muCciisOmWbSe4tpMQXEP57E_Zd-8ek8gdIf0pEg9SXZFYjLfJ5w
Message-ID: <CAEnQRZCT2ghW69zvZZHPb+GHVLGFO=2A2hGxjuM0Phqjve8xgQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] gpio: vf610: drop unnecessary wrappers
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_074152_926645_CCD9E00D 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 3:52=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Remove trivial wrapper functions vf610_gpio_writel() and
> vf610_gpio_readl() that just called the relaxed versions directly.
> Replace their usage with direct calls to writel_relaxed() and
> readl_relaxed().
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

