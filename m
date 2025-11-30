Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC4DCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 20:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=la7nNYnGA5UFGfCGw4M01JexFE7uuT8svI7Jr+3Wjmc=; b=P8GM48DzCkv/BY9ceMwWu3Juae
	LMughZpSQU4WSc6Rdcw1g2Z8KhWcnn7cIQ3yVbD6nPxMZNV6FA0h9FBD52X5YRNrmSTq74KNK7ayv
	kf7CpCMiniKMwA2IHfqraQGN1ljOH0SytB6krO4igHwt9S8LrIoxRZun0TjNdjaQntuJhCr29aaq3
	uGU5ziRSqlkSnINzT9KxOq3bo4K1gt5CgsriKy6Z2stHY3JO0tWgIYhgxdJtR1omIO1a+0P7D1FCk
	gWzz1+hqP1PYyInWtpV5T+lvBXHo6fRi1I3ryY5iNR3AIjDzB6xXIrUVCDTaHXtd1i9JlA9z01IVp
	4TLJ1Ojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPncU-00000002XSo-11BW;
	Sun, 30 Nov 2025 20:02:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPncS-00000002XSX-2KJ8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Nov 2025 20:02:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2809060052;
	Sun, 30 Nov 2025 20:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC3EC4CEF8;
	Sun, 30 Nov 2025 20:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764532921;
	bh=GQeTafnOimj+SHBm4UuQqXcgzbjRJYkDWL0p2vAkIrQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ke4KROZZUJGyqDTHZ7OXeybILhA2G3+aeruNIrHBMdP/SeLfraILK5dBkcJRqUeWY
	 yFtTz7mB39fbcZlZaZ95rN/ebw8mF4RtQK8vBlnci70PkpPC07VjpkmpF5PyVKp5m1
	 Yb8+m07Ji800a57LjPvJ4hV6mYd3x19sU4OZEAm3DgVwULTaUzNAD5gukq4zwR80YC
	 PH4GIrvH9ZVDnYI39aWw4HPX7JoSj1cJe5QcKpEOmlWEzpfe8S98+d4QaIjiP6C2Ns
	 Flubn06xCnc1MIi0ceXZh2u29n79ZO9nQatDaPmpUf6boP6od5ffJDAj3K/PcR0HUw
	 CIe956fqini3w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251126173430.1556604-1-andersson@kernel.org>
References: <20251126173430.1556604-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.19
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Taniya Das <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Luo Jie <quic_luoj@quicinc.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Luca Weiss <luca.weiss@fairphone.com>, Jens Reidel <adrian@mainlining.org>, Alexey Minnekhanov <alexeymin@postmarketos.org>, Gabor Juhos <j4g8y7@gmail.com>, Nathan Chancellor <nathan@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Sun, 30 Nov 2025 12:01:59 -0800
Message-ID: <176453291936.11952.7135169229831586011@lazor>
User-Agent: alot/0.11
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

Quoting Bjorn Andersson (2025-11-26 09:34:30)
>=20
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.19
>=20
> for you to fetch changes up to 3664282f3345fdfa6a154feb6ed6c3217a8b3b0d:
>=20
>   clk: qcom: x1e80100-dispcc: Add USB4 router link resets (2025-11-18 16:=
11:37 -0600)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

drivers/clk/qcom/camcc-sm7150.c:1898:15: warning: symbol 'camcc_sm7150_hws'=
 was not declared. Should it be static?

